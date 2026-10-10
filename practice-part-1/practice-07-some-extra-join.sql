-- FULL OUTER JOIN 
SELECT * FROM employee_salary;

SELECT sal.first_name, sal.last_name, occupation, demo.employee_id, sal.employee_id
FROM employee_salary AS sal
INNER JOIN employee_demographics AS demo
ON sal.employee_id = demo.employee_id;



SELECT *
FROM employee_salary AS sal
INNER JOIN employee_demographics AS demo
ON sal.employee_id = demo.employee_id;

SELECT *
FROM employee_sal sal
LEFT JOIN employee_demographics demo
ON sal.employee_id = demo.employee_id;

SELECt *
FROM employee_salary sal
RIGHT JOIN employee_demographics demo
ON demo.employee_id = sal.employee_id;

SELECT * 
FROM employee_salary sal
LEFT JOIN employee_demographics demo
ON demo.employee_id =sal.employee_id
UNION
SELECT *
FROM employee_salary sal
RIGHT JOIN employee_demographics demo
ON demo.employee_id = sal.employee_id;

SELECT *
FROM employee_salary sal
JOIN employee_demographics demo
ON sal.employee_id = demo.employee_id
OR sal.employee_id <> demo.employee_id;

-- this type of FULL JOIN or FULL OUTER JOIN
-- SELECT *
-- FROM employee_demographics demo
-- FULL JOIN employee_salary sal
-- ON demo.employee_id = sal.employee_id;

-- CROSS JOIN
SELECT demo.first_name, sal.occupation
FROM employee_demographics demo
CROSS JOIN employee_salary sal;

SELECT *
FROM parks_departments;

SELECT sal.first_name, dept.department_id, dept.department_name
FROM employee_salary sal
CROSS JOIN parks_departments dept
ORDER BY dept.department_id;

SELECT * 
FROM employee_demographics;



SELECT 
	sal.employee_id,
    CONCAT(demo.first_name, ' ', demo.last_name) AS full_name, 
    sal.occupation
FROM employee_demographics demo
INNER JOIN employee_salary sal
ON demo.employee_id = sal.employee_id;


-- CROSS JOIN
SELECT 
	sal.employee_id,
    CONCAT(demo.first_name, ' ', demo.last_name) AS full_name,
    sal.occupation,
    park_dept.department_name,
    park_dept.department_id
FROM employee_demographics demo
INNER JOIN employee_salary sal
ON demo.employee_id = sal.employee_id
CROSS JOIN parks_departments park_dept
ORDER BY park_dept.department_id;

-- NATURAL JOIN
SELECT *
FROM employee_demographics demo
NATURAL JOIN employee_salary sal;

SELECT * 
FROM employee_salary sal
NATURAL JOIN parks_departments park_dept
ORDER BY park_dept.department_id;


-- SELF JOIN
SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics AS demo
JOIN employee_demographics AS emp
ON demo.employee_id = emp.employee_id;

SELECT *
FROM employee_salary AS sal
JOIN employee_salary AS emp_sal
ON sal.employee_id = emp_sal.dept_id;


SELECT sal.employee_id,
	emp_sal.dept_id,
    CONCAT(sal.first_name, ' ', sal.last_name) AS full_name,
    emp_sal.occupation
FROM employee_salary AS sal
JOIN employee_salary AS emp_sal
ON sal.employee_id = emp_sal.dept_id;

SELECT sal.employee_id,
	emp_sal.dept_id,
    CONCAT(sal.first_name, ' ', sal.last_name) AS full_name,
    emp_sal.occupation
FROM employee_salary AS sal
JOIN employee_salary AS emp_sal
ON sal.employee_id = emp_sal.employee_id;



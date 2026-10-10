-- view

DROP VIEW IF EXISTS occupation_director;

CREATE VIEW occupation_director AS 
SELECT 
	employee_id, 
	first_name, 
    last_name, 
    occupation, 
    dept_id
FROM employee_salary
WHERE occupation LIKE '%Director%';

CREATE OR REPLACE VIEW occupation_director AS
SELECT 
	employee_id,
    first_name,
    last_name,
    occupation AS job_title,
    dept_id
FROM employee_salary
WHERE occupation LIKE '%director%';


DROP VIEW IF EXISTS employee_department;

CREATE VIEW employee_department AS
SELECT 
	sal.employee_id, 
    demo.first_name,
    sal.last_name,
    sal.occupation,
    demo.age,
    demo.gender
FROM employee_salary AS sal
JOIN employee_demographics AS demo
	ON sal.employee_id=demo.employee_id;

UPDATE employee_department
SET occupation= 'cheif malik'
WHERE occupation LIKE '%ceo%';

SELECT * FROM occupation_director;
 
SELECT * FROM employee_department;
	
-- Join two view
SELECT first_name, last_name, employee_id 
FROM occupation_director
UNION
SELECT first_name, last_name, employee_id 
FROM employee_department;

SELECT first_name, last_name, employee_id 
FROM occupation_director
UNION
SELECT gender, age, occupation
FROM employee_department;


SELECT * 
FROM employee_salary;

SELECT * 
FROM employee_demographics;

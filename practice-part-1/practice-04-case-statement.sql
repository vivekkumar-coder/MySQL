-- Case Statements

SELECT *,
CASE 
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age BETWEEN 51 AND 80 THEN 'retired'
    WHEN age >= 80 THEN "On the Death's Door"
END stage
FROM employee_demographics;


-- Pay increases and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus 

SELECT
	first_name, 
    last_name, 
    salary,
	CASE 
	WHEN salary < 50000 THEN salary * 0.05
    WHEN salary > 50000 THEN salary * 0.07
	END inceamental_salary,
	salary + CASE
		WHEN salary < 50000 THEN salary * 0.05
		ELSE salary * 0.07
    END AS total_salary
FROM employee_salary;



SELECT
	first_name, 
    last_name, 
    salary,
	CASE 
		WHEN salary < 50000 THEN salary * 1.05
		WHEN salary > 50000 THEN salary * 1.07
	END inceamental_salary,
	CASE
		WHEN dept_id = 6 THEN salary * 1.1
    END AS bonus
FROM employee_salary;

SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;



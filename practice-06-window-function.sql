-- Window Function

SELECT 
	gender, 
	AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
SELECT * FROM employee_demographics;
    
SELECT * FROM employee_salary;


SELECT 
	dem.first_name,
    dem.last_name,
	gender, 
	AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
SELECT occupation, MAX(salary) AS max_salary 
FROM employee_salary
GROUP BY occupation;
;

SELECT e.*,
	MAX(salary) OVER() AS max_salary
FROM employee_salary e;


SELECT s.*,
	MAX(salary) OVER(PARTITION BY occupation) AS max_salary
FROM employee_salary s;


-- ROW_NUMBER, RANK , DENSE_RANK, LEAD and LAG
SELECT *,
	ROW_NUMBER() OVER() AS row_no
FROM employee_salary ;

-- Fetch the first 2 employees from each department to join the company
SELECT *,
	ROW_NUMBER() OVER(PARTITION BY occupation) AS row_no
FROM employee_salary ;


SELECT * 
FROM (SELECT *,
	ROW_NUMBER() OVER(PARTITION BY occupation) AS row_no
    FROM employee_salary) x
WHERE x.row_no < 2;

-- Fetch the top 3 employees in each department earning the max salary
SELECT *,
	RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS rnk
FROM employee_salary;

SELECT * 
FROM ( SELECT *,
	RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS rnk
    FROM employee_salary) x
WHERE x.rnk <2;


SELECT *,
	RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS dense_rnk
FROM employee_salary;


SELECT *,
	RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) AS dense_rnk,
    ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY salary DESC) AS row_no
FROM employee_salary;

-- Fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee
SELECT *,
	LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id) AS prev_emp_salary
FROM employee_salary;

SELECT *,
	LAG(salary, 2, 0) OVER(PARTITION BY occupation ORDER BY employee_id) AS prev_emp_salary
FROM employee_salary;

SELECT *,
	LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id) AS prev_emp_salary,
    LEAD(salary) OVER(PARTITION BY occupation ORDER BY employee_id) AS next_emp_salary
FROM employee_salary;


SELECT *,
	LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id) AS prev_emp_emp,
    CASE
		WHEN salary > LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id) 
			THEN 'Higher than previous employee'
		WHEN salary > LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id)
			THEN 'Lower than previous employee'
		WHEN salary = LAG(salary) OVER(PARTITION BY occupation ORDER BY employee_id)
			THEN 'Same as than previous employee'
	END AS sal_range
FROM employee_salary;

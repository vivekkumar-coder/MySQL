-- SQL Query  -- Done
-- INSERT
-- UPDATE
-- DELETE

SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

INSERT INTO employee_salary
SELECT 
	sal.employee_id,
	sal.first_name, 
	sal.last_name, 
    sal.occupation, 
    sal.salary, 
    sal.dept_id
FROM employee_salary sal
JOIN employee_demographics demo
ON demo.first_name = sal.first_name
WHERE NOT EXISTS (SELECT 1
				  FROM employee_salary emp_sal
                  WHERE emp_sal.employee_id = sal.employee_id);
                  
                  
-- UPDATE 
UPDATE employee e
SET salary = (SELECT MAX(salary) + (MAX(salary)* 0.1)
			 FROM employee_history eh
             WHERE eh.dept_name = e.dept_name)
WHERE e.dept_name IN (SELECT dept_name
					  FROM department
                      WHERE location = 'bangalore')
AND e.emp_id IN (SELECT emp_id FROM employee_history);

SELECT * FROM employee_salary;


-- DELETE
SELECT occupation, dept_id
FROM employee_salary sal
WHERE NOT EXISTS (SELECT 1 
				 FROM parks_departments p_dept
				 WHERE p_dept.dept_id= sal.dept_id);


SELECT * FROM employee_salary;
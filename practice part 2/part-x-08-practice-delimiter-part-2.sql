USE parks_and_recreation;

SHOW TABLES;

-- DELIMITER $$
-- CREATE PROCEDURE large_salaries();

DELIMITER $$

DROP PROCEDURE IF EXISTS largesalary2 $$

CREATE PROCEDURE large_salary2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary> (
		SELECT AVG(salary) 
		FROM employee_salary
	);
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$

DROP PROCEDURE IF EXISTS large_salaries4 $$

CREATE PROCEDURE large_salaries4()
BEGIN
	SELECT *
    FROM employee_salary;
END $$

DROP PROCEDURE IF EXISTS large_salaries6 $$

CREATE PROCEDURE large_salaries6(employee_id INT)
BEGIN
	SELECT *
    FROM employee_salary
    WHERE employee_id=employee_id;
END $$

DROP PROCEDURE IF EXISTS large_salaries8 $$

CREATE PROCEDURE large_salaries8(emp_id INT)
BEGIN
	SELECT *
    FROM employee_salary
    WHERE employee_id=emp_id;
END $$

DELIMITER ;




CALL large_salary2();
CALL large_salaries4();
CALL large_salaries6(5);
CALL large_salaries8(1);


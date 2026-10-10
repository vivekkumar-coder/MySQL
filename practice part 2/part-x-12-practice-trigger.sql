-- Trigger
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$

DROP TRIGGER IF EXISTS employee_insert $$
CREATE TRIGGER employee_insert
	-- BEFORE INSERT ON employee_salary
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(14, 'Jean-Ralphio', 'Saperstein','Entertainment 720 CEO', 100000,NULL);
SELECT * 
FROM employee_salary;

DELIMITER $$

DROP PROCEDURE IF EXISTS get_occupation $$

CREATE PROCEDURE get_occupation(
	IN depart_emp_id INT
)
BEGIN 
	SELECT *
    FROM employee_salary
    WHERE employee_id = depart_emp_id;
END $$

DROP PROCEDURE IF EXISTS count_employee  $$

CREATE PROCEDURE count_employee(
	OUT total INT
)
BEGIN
	SELECT COUNT(*)
    INTO total
    FROM employee_salary;
END $$

DROP PROCEDURE IF EXISTS check_salary $$

CREATE PROCEDURE check_salary(
	IN emp_salary DECIMAL(10,2)
)
BEGIN 
	SELECT salary
    INTO emp_salary
    FROM employee_salary
    WHERE employee_id = emp_id;
    
	IF salary >=  60000 THEN
		SELECT 'High Salary' AS result;
	ELSE 
		SELECT 'Low Salary' AS result;
	END IF;
END $$

DELIMITER ;

SHOW CREATE PROCEDURE check_salary;

 
 CALL get_occupation(10);
 CALL get_occupation(1000);

 CALL count_employee(@employee_id);
 SELECT @employee_id AS total;
 
 CALL check_salary(60000);
 
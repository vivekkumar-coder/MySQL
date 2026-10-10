-- EVENTS
SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
	WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';
-- Case Statements

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS age_bracket
FROM employee_demographics
;

-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus 

SELECT first_name,
last_name,
salary,
CASE 
	WHEN salary < 50000 THEN salary * 0.05 + salary
    WHEN salary > 50000 THEN salary * 0.07 + salary
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .1
END AS bonus
FROM employee_salary
;


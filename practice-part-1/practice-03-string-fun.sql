-- String  Functions

SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT UPPER(' sly_ sf  343 ()');

SELECT LOWER(' SKY ');


SELECT first_name, LENGTH(first_name), UPPER(first_name)
FROM employee_demographics
ORDER BY 2;


-- Trim function
SELECT ('            sdfsd             ');
SELECT TRIM('            sdfsd             ');
SELECT LTRIM('            sdfsd             ');
SELECT RTRIM('            sdfsd             ');

SELECT first_name, 
LEFT(first_name, 4) char_left4,
RIGHT(first_name, 4) char_right4,
SUBSTRING(first_name, 3, 2) substring1,
SUBSTRING(first_name, -4) AS last_4_char,
SUBSTRING(first_name, LENGTH(first_name)-3, 4),
REVERSE(SUBSTRING(first_name, LENGTH(first_name) - 4, 5)),
birth_date,
SUBSTRING(birth_date, LENGTH(birth_date)-4, 2) AS birth_month
FROM employee_demographics;

SELECT * 
FROM employee_demographics
WHERE SUBSTRING(birth_date, LENGTH(birth_date)-4, 2) = 03;

SELECT first_name, REPLACE(first_name,'a', 'z')
FROM employee_demographics;

SELECT LOCATE('x','Alexander');

SELECT *, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) full_name
FROM employee_demographics;


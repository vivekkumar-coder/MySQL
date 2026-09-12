-- String Functions

SELECT LENGTH('SKYFALL');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;

SELECT UPPER('sky');
SELECT LOWER('Sky');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

SELECT ('        sky       ');

-- Trim() is used for removing outer extra spaces 
SELECT TRIM('          sky      ');
SELECT TRIM('     sk    y       ');

-- Left Trim
SELECT LTRIM('        sky       ');

-- Right Trim
SELECT RTRIM('        sky        ');

-- Left(name, number) is used for select/show number of character from left side
SELECT first_name, 
LEFT(first_name, 4)
FROM employee_demographics
;

-- Right(name, number) is used for select/show number of character from right side
SELECT first_name, 
RIGHT(first_name, 4)
FROM employee_demographics
;

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4)
FROM employee_demographics
;

-- SubString(name, postion, length) 
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2)
FROM employee_demographics
;

-- Replace(name, search_string, replace_string)
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

-- Locate(input_substring, Search_string)
SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('A', first_name)
FROM employee_demographics
;

-- Concat(string1, string2, ...)
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name)  AS full_name
FROM employee_demographics
;


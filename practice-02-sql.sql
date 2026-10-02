CREATE DATABASE student_data;
USE student_data;

CREATE TABLE student
	(roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(20)
);

INSERT INTO student
	(roll_no, name, course)
VALUES
	(12, 'Asharaf', 'CS'),
    (13, 'Romiyo', 'IT'),
    (15, 'Kamlesh', 'ME'),
    (16, 'Kallu','BA'),
    (17, 'Nandali','BA'),
    (18, 'Nandu', 'AI');
    
CREATE TABLE sport_data(
	roll_no INT PRIMARY KEY, 
    sport VARCHAR(50)
);

INSERT INTO sport_data
	(roll_no, sport)
VALUES 
	(13,'kho-kho'),
    (17, 'cricket'),
    (15, 'base ball');
    
SELECT * FROM student;

SELECT * FROM sport_data;

INSERT INTO sport_data
	(roll_no, sport)
VALUES
	(21, 'batmenton');

SELECT * 
FROM student AS s
INNER JOIN sport_data AS game
ON s.roll_no= game.roll_no;

SELECT *
FROM student AS s
LEFT JOIN sport_data AS game
ON s.roll_no = game.roll_no;


SELECT * 
FROM student AS s 
RIGHT JOIN sport_data AS game
ON s.roll_no = game.roll_no; 

SELECT * 
FROM student AS s 
LEFT JOIN sport_data AS game
ON s.roll_no = game.roll_no
UNION
SELECT *
FROM student AS s
RIGHT JOIN sport_data AS game
ON s.roll_no = game.roll_no;

-- Exclusive LEFT JOIN
SELECT * 
FROM student AS s
LEFT JOIN sport_data AS game
ON s.roll_no = game.roll_no
WHERE game.roll_no IS NULL;

-- Exclusive RIGHT JOIN
SELECT *
FROM student AS s
RIGHT JOIN sport_data AS game
ON s.roll_no = game.roll_no
WHERE s.roll_no IS NULL;

-- self join
SELECT s.roll_no AS enrol_number, t.course AS subject
FROM student AS s
JOIN student AS t
ON s.roll_no = t.roll_no;


-- Union 
SELECT roll_no FROM student
UNION 
SELECT roll_no FROM sport_data;

SELECT name FROM student
UNION
SELECT sport FROM sport_data;

-- Union All
SELECT name FROM student
UNION ALL
SELECT sport FROM sport_data;


-- Sub Queries
ALTER TABLE student
ADD mark INT NOT NULL DEFAULT 70;

SELECT * FROM student;

UPDATE student
SET mark = CASE roll_no
    WHEN 12 THEN 69
    WHEN 13 THEN 98
    WHEN 15 THEN 45
    WHEN 16 THEN 65
    WHEN 17 THEN 87
    WHEN 18 THEN 78
END
WHERE roll_no IN (12, 13, 15, 16, 17, 18);


SELECT * FROM student;

SELECT AVG(mark)
FROM student;

SELECT name, mark
FROM student 
WHERE mark > 73.337;


SELECT name, mark
FROM student
WHERE mark >
	(SELECT AVG(mark)
    FROM student)
;

SELECT name , roll_no
FROM student
WHERE (roll_no % 2) =0;

SELECT *
FROM student
WHERE (roll_no % 2) =0;

SELECT roll_no
FROM student
WHERE roll_no % 2 = 0;

SELECT name, roll_no
FROM student
WHERE roll_no IN (12, 16, 18);

SELECt name, roll_no
FROM student 
WHERE roll_no IN (
	SELECT roll_no
    FROM student 
    WHERE roll_no % 2 =0)
;

ALTER TABLE student
ADD address VARCHAR(50);

UPDATE student
SET address = CASE roll_no
    WHEN 12 THEN 'pune'
    WHEN 13 THEN 'delhi'
    WHEN 15 THEN 'mumbai'
    WHEN 16 THEN 'hyderabad'
    WHEN 17 THEN 'pune'
    WHEN 18 THEN 'delhi'
END
WHERE roll_no IN (12, 13, 15, 16, 17, 18);

SELECT * FROM student;

SELECT name, roll_no, address
FROM student
WHERE mark = 
	(SELECT MAX(mark) 
    FROM student)
;

SELECT MAX(mark)
FROM (SELECT * 
	FROM student 
	WHERE address = 'delhi') AS temp;

SELECT MAX(mark)
FROM (SELECT * 
	FROM student 
	WHERE address = 'pune') AS temp;

SELECT * FROM student;


SELECT MAX(mark)
FROM (SELECT * 
	FROM student 
	WHERE address = 'mumbai') AS temp;


SELECT MAX(mark)
FROM student
WHERE address = 'delhi';


SELECT (SELECT MAX(mark) FROM student) AS max_mark , name
FROM student;


CREATE VIEW view1 AS 
SELECT roll_no, name
FROM student;

SELECT *
FROM view1;

CREATE VIEW view2 AS
SELECT roll_no, name, address
FROM student;

SELECT * 
FROM view2;

SELECT * 
FROM view2 ;

SELECT * FROM student;

CREATE VIEW view3 AS
SELECT roll_no, name, course, mark
FROM student;

SELECT *
FROM view3
WHERE mark > 80;

SELECT * 
FROM view3;

SELECT *
FROM view3
WHERE mark > 
	(SELECT AVG(mark) FROM student);


DROP VIEW IF EXISTS  view1, view2, view3;

SELECT * FROM view1;


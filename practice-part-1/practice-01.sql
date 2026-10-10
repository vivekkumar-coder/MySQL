CREATE DATABASE student_data;
USE student_data;

CREATE TABLE student
	(roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(20)
);

-- INSERT INTO student
-- 	(roll_no, name, course)
-- VALUES
-- 	(12, 'Asharaf', 'CS'),
--     (13, 'Romiyo', 'IT'),
--     (15, 'Kamlesh', 'ME'),
--     (16, 'Kallu','BA'),
--     (17, 'Nandali','BA'),
--     (18, 'Nandu', 'AI');
--     
-- SELECT * FROM student;

-- ALTER TABLE student
-- ADD COLUMN age INT NOT NULL DEFAULT 19;
--     
-- ALTER TABLE student 
-- MODIFY age VARCHAR(2);

-- ALTER TABLE student
-- CHANGE age st_age INT;

-- ALTER TABLE student
-- CHANGE st_age age INT;

-- ALTER TABLE student
-- DROP COLUMN st_age;

-- ALTER TABLE student
-- RENAME TO stud;
--     
-- SELECT * FROM stud;

-- ALTER TABLE stud
-- RENAME TO student;

-- SELECT * FROM student;


-- ALTER TABLE student 
-- DROP COLUMN age;

-- SELECT * FROM student;

-- TRUNCATE TABLE  student;

-- SELECT * FROM student;

ALTER TABLE student
CHANGE name full_name VARCHAR(50);

INSERT INTO student
	(roll_no, name, course)
VALUES
	(12, 'Asharaf', 'CS'),
    (13, 'Romiyo', 'IT'),
    (15, 'Kamlesh', 'ME'),
    (16, 'Kallu','BA'),
    (17, 'Nandali','BA'),
    (18, 'Nandu', 'AI');
    
SELECT * FROM  student;

-- ALTER TABLE student
DELETE FROM sudent
WHERE  roll_no > 16;

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN course;

SELECT * FROM student;

DROP TABLE student;

DROP DATABASE student_data;

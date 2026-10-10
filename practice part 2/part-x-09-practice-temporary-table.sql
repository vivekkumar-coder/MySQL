-- Temp Table
DROP TABLE IF EXISTS customerInfo;

CREATE TEMPORARY TABLE customerInfo(
	customerNumber INT,
    customerName VARCHAR(50),
    phone BIGINT,
    addressLine1 VARCHAR(100),
    city VARCHAR(20), 
    creditLimit FLOAT
);

INSERT INTO customerInfo
VALUES
	(1, 'Aditya', 435534534, 'L-1, zero road', 'Musalampur', 4543.3345),
    (2,'asdfa', 245234,'L2, dafasd','ajfdlsjd', 43535.354),
    (3,'dfasdf',34323423, 'k32434234ajfkajl','afd',54343.2342);
    

SELECT ROUND(AVG(creditLimit), 2) AS average_credit_limit
FROM customerInfo;

DROP TEMPORARY TABLE customerInfo;

DROP TEMPORARY TABLE IF EXISTS officeInfo;

CREATE TEMPORARY TABLE officeInfo
SELECT * 
FROM offices
WHERE country LIKE 'U%';

SELECT *
FROM officeInfo;

DROP TEMPORARY TABLE officeInfo;

SELECT * FROM offices;



DELIMITER $$

DROP FUNCTION IF EXISTS square_num $$
DROP FUNCTION IF EXISTS calculate_age $$
DROP FUNCTION IF EXISTS discount_price $$

CREATE FUNCTION square_num(n INT)
RETURNS INT
DETERMINISTIC 
BEGIN
	RETURN n*n;
END $$

CREATE FUNCTION calculate_age(birth_year INT)
RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN YEAR(CURRENT_DATE()) - birth_year;
END $$

CREATE FUNCTION discount_price(
	price DECIMAL(10,2),
    discount_percent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	RETURN price - (price*discount_percent/100);
END $$

DELIMITER ;


SELECT square_num(5), calculate_age(2005), discount_price(1000, 20);
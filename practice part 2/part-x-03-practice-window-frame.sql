-- WINDOW FRAME
SELECT 
	productCode,
    buyPrice,
    MSRP,
       AVG(MSRP) OVER(
		ORDER BY buyPrice DESC
        ROWS BETWEEN 0 PRECEDING AND CURRENT ROW
    ),
       AVG(MSRP) OVER(
		ORDER BY buyPrice DESC
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ),
    AVG(MSRP) OVER(
		ORDER BY buyPrice DESC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ),
	AVG(MSRP) OVER(
		ORDER BY buyPrice DESC
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ),
       AVG(MSRP) OVER(
		ORDER BY buyPrice DESC
        ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
    )
FROM products;

SELECT * FROM products;


-- -----------------------------------------------------------------------------------
WITH ranked AS (
	SELECT 
		productCode,
        orderNumber,
        priceEach,
        ROW_NUMBER() OVER(
			PARTITION BY orderNumber
            ORDER BY priceEach DESC
		) AS rnk
	FROM orderdetails
)
SELECT 
	productCode,
    orderNumber,
    priceEach
FROM ranked
WHERE rnk <=2;

WITH ranked1 AS(
	SELECT 
		productCode,
        priceEach,
        orderNumber,
        DENSE_RANK() OVER(
			PARTITION BY orderNumber
            ORDER BY priceEach DESC
		) as dense_rnk
	FROM orderdetails
)
SELECT *
FROM ranked1
where dense_rnk <=2;

SELECT 
	productCode,
    orderNumber,
    SUM(priceEach) OVER(
		ORDER BY orderNumber
	) AS running_total
FROM orderdetails;

SELECT 
	productCode,
    orderNumber,
    SUM(priceEach) OVER(
		PARTITION BY orderNumber
		ORDER BY orderNumber
	) AS running_total
FROM orderdetails;


SELECT * FROM orderdetails;

-- -----------------------------------------------------------------------------------
WITH ranked2 AS(
	SELECT
		customerNumber,
        customerName,
        country,
        ROW_NUMBER() OVER(
			PARTITION BY country
            ORDER BY country DESC
		) AS  row_num
	FROM customers
)
SELECT *
FROM ranked2
WHERE row_num = 1;

select * from customers;
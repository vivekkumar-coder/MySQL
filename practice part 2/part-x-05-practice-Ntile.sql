-- Ntile

SELECT 
	productCode,
    productName,
    productLine,
    SUM(buyPrice) OVER(
		ORDER BY productLine
    ) AS running_sales
FROM products;

SELECT 
	productCode,
    productName,
    productLine,
    SUM(buyPrice) OVER(
		PARTITION BY productLine
		ORDER BY productName 
    ) AS running_sales
FROM products;

SELECT productLine
FROM products
GROUP BY productline;


SELECT 
	productCode,
    productScale,
    productline,
    buyPrice,
    quantityInStock,
    NTILE(5) OVER(
		PARTITION BY buyPrice
        ORDER BY productScale
    )
FROM products;

SELECT * FROM products;
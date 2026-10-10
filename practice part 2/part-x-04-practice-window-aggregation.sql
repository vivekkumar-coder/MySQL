-- Window Aggregation

SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    SUM(amount)  OVER(
        ORDER BY customerNumber
    ) AS running_sales
FROM payments;

SELECT 
	checkNumber,
    paymentDate,
    amount,
    customerNumber,
    SUM(amount) OVER(
		PARTITION BY customerNumber
        ORDER BY amount
    )
FROM payments;


-- Running count 
SELECT 
	checkNumber,
    paymentDate,
    amount,
    customerNumber,
    ROUND(AVG(amount) OVER(
		ORDER BY customerNumber
		),2
	)
FROM payments;

SELECT 
	checkNumber,
    paymentDate,
    amount,
    customerNumber,
    COUNT(amount) OVER(
		ORDER BY customerNumber
	)
FROM payments;

SELECT 
	checkNumber,
    paymentDate,
    amount,
    customerNumber,
    COUNT(*) OVER(
		ORDER BY customerNumber
	)
FROM payments;

-- Running count with partition by
SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
    COUNT(amount) OVER(
		PARTITION BY customerNumber
        ORDER BY paymentDate
    ) 
FROM payments;

-- 3-Day Moving Average
SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
    AVG(amount) OVER(
		ORDER BY customerNumber
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	)
FROM payments;

-- Moving SUM()
SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
    SUM(amount) OVER(
		ORDER BY customerNumber
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    )
FROM payments;

SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
	COUNT(*) OVER(
		ORDER BY customerNumber
    )
FROM payments;


SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
	COUNT(amount) OVER(
		ORDER BY customerNumber
    )
FROM payments;

SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
    
    -- Running Total
    SUM(amount) OVER(
		ORDER BY customerNumber
	) AS running_total,
    
    -- Running average
    AVG(amount) OVER(
		ORDER BY customerNumber
    ) AS running_avg,
    
    -- Cumulative count
    COUNT(*) OVER(
		ORDER BY customerNumber
	) AS cumulative_count,
    
    -- 3-day rolling average
    AVG(amount) OVER(
		ORDER BY customerNumber
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS rolling_3_day_avg
FROM payments;
    
    

SELECT 
	checkNumber,
    paymentDate,
    customerNumber,
    amount,
    
    -- Running Total
    SUM(customerNumber) OVER(
		ORDER BY customerNumber
	) AS running_total,
    
    -- Running average
    AVG(customerNumber) OVER(
		ORDER BY customerNumber
    ) AS running_avg,
    
    -- Cumulative count
    COUNT(*) OVER(
		ORDER BY customerNumber
	) AS cumulative_count,
    
    -- 3-day rolling average
    AVG(customerNumber) OVER(
		ORDER BY customerNumber
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS rolling_3_day_avg
FROM payments;

    

SELECT * FROM payments;

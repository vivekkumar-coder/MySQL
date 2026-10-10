-- Date and Time Analytics


-- Use of YEARS() AND MONTH()
SELECT 
	YEAR(orderDate) AS YEAR, 
    MONTH(orderDate) AS MONTH,
    SUM( customerNumber) AS x
FROM orders
GROUP BY
	YEAR(orderDate),
    MONTH(orderDate)
ORDER BY 
	YEAR, 
    MONTH;
    
-- order of this year
SELECT 
	YEAR(orderDate) AS year,
    SUM(customerNumber)
FROM orders
GROUP BY year
ORDER BY year;

SELECT * FROM orders;

-- shipped by month Using DATE_FORMAT()
SELECT 
	DATE_FORMAT(orderDate, '%m-%Y') AS month,
    SUM(customerNumber) AS total_customer
FROM orders
GROUP BY month
ORDER BY month;

-- Month over month growth
WITH monthly_sales AS (
	SELECT 
		DATE_FORMAT(orderDate, '%Y-%m') AS month,
        SUM(customerNumber) AS total_customer
	FROM orders
    GROUP BY month
)
SELECT 
	month, 
    total_customer,
    LAG(total_customer) OVER(
		ORDER BY month
	) AS previousCustomer
FROM monthly_sales;


WITH shipped AS(
	SELECT 
		DATE_FORMAT(shippedDate, '%Y-%m')AS month,
        SUM(customerNumber) AS shipped_customer
	FROM orders
    GROUP BY month
),
Comparsion AS(
	SELECT
		month, 
		shipped_customer,
		LAG(shipped_customer) OVER(
			ORDER BY month
		) AS previous_shipped
    FROM shipped
)
SELECT 
	month, 
    shipped_customer,
	previous_shipped,
    ROUND(
		(shipped_customer-previous_shipped)*100/previous_shipped, 2
    ) AS rate_growth
FROM comparsion;


-- year over year growth
WITH monthly_shipped AS (
	SELECT 
		YEAR(shippedDate) AS year,
        MONTH(shippedDate) AS month,
        SUM(customerNumber) AS sales
	FROM orders
    GROUP BY
		YEAR(shippedDate),
		MONTH(shippedDate)
)
SELECT
	year,
    month,
    sales,
    LAG(sales) OVER(
		PARTITION BY month
        ORDER BY year
	) AS pervious_year_sales
FROM monthly_shipped;

-- Daily Active User
SELECT 
	DATE(requiredDate) AS activity_date,
    COUNT(DISTINCT orderNumber) AS dau
FROM orders
GROUP BY activity_date
ORDER BY activity_date;


WITH first_purchase AS(
	SELECT 
		orderNumber,
        MIN(orderDate) AS first_order_date
	FROM orders
    GROUP BY orderNumber
)
SELECT *
FROM first_purchase;

SELECT 
	orderNumber,
    orderDate,
    requiredDate,
    DATEDIFF(requiredDate, orderDate) AS process,
    TIMESTAMPDIFF(HOUR, orderDate, requiredDate) AS procesHour,
    TIMESTAMPDIFF(SECOND, orderDate,requiredDate) AS procesSecond,
    TIMESTAMPDIFF(MINUTE, orderDate,requiredDate) AS procesMinute,
    TIMESTAMPDIFF(DAY,orderDate,requiredDate) AS procesDay,
    TIMESTAMPDIFF(MONTH, orderDate, requiredDate) AS processMonth,
    TIMESTAMPDIFF(YEAR, orderDate, requiredDate) AS processYear,
    TIMESTAMPDIFF(WEEK, orderDate, requiredDate) AS processWeek
FROM orders;

SELECT 
	orderNumber,
    requiredDate,
    DATE_ADD(requiredDate, INTERVAL 1 DAY) AS addDay,
	DATE_ADD(requiredDate, INTERVAL 1 MONTH) AS addMonth,
	DATE_ADD(requiredDate, INTERVAL 1 YEAR) AS addYear,
    DATE_ADD(requiredDate, INTERVAL 10 SECOND) AS addSecond,
    DATE_ADD(requiredDate, INTERVAL 10 MINUTE) AS addMinute,
    DATE_ADD(requiredDate, INTERVAL 10 HOUR) AS addHour,
    DATE_ADD(requiredDate, INTERVAL 1 WEEK) AS addWeek
    
FROM orders;

SELECT 
	shippedDate,
    DATE_SUB(shippedDate, INTERVAL 1 DAY) AS subDay,
    YEARWEEK(NOW()),
    YEARWEEK(shippedDate)
FROM orders;

SELECT * FROM orders;
-- ---------------------------------------------------------------------------------------
WITH first_purchase1 AS (
	SELECT 
		customerNumber,
        DATE_FORMAT(MIN(paymentDate), '%Y-%m') AS cohort_month
	FROM payments
    GROUP BY customerNumber
),
customer_months1 AS (
	SELECT DISTINCT 
		customerNumber,
        DATE_FORMAT(paymentDate , '%Y-%m') AS activity_month
	FROM payments
)
SELECT 
	fp.cohort_month,
    cm.activity_month,
    COUNT(DISTINCT cm.customerNumber) AS active_customers
FROM first_purchase1 fp
JOIN customer_months1 cm
	ON fp.customerNumber = cm.customerNumber
GROUP BY
	fp.cohort_month,
    cm.activity_month
ORDER BY
	fp.cohort_month,
    cm.activity_month;

SELECT 
	paymentDate, 
	YEAR(paymentDate) AS paymentYear,
    MONTH(paymentDate) AS paymentMonth,
    DAY(paymentDate) AS paymentDay,
	CURRENT_DATE() AS currentDate,
    CURRENT_TIME() AS currentTime,
    CURRENT_TIMESTAMP() AS timeStamp,
    CURRENT_USER() AS activeUser,
    NOW() AS inThisTime
FROM payments;

SELECT 
	paymentDate,
    SUM(amount) AS total_amount,
    COUNT(customerNumber) AS total_customer
FROM payments
GROUP BY paymentDate;


SELECT * from payments;
-- -------------------------------------------------------------------------------------
SELECT * FROM products;



-- CTE part-2
SELECT * FROM layoffs;

SELECT l.stage, SUM(funds_raised_millions) AS total_funds_millions
FROM layoffs l
GROUP BY l.stage;


SELECT CAST(AVG(total_funds_millions) AS SIGNED) AS avg_funds
FROM (SELECT l.stage, SUM(funds_raised_millions) AS total_funds_millions
	FROM layoffs l
    GROUP BY l.stage) x;
    
    
-- SELECT total_fund.stage, total_fund.total_funds_millions, avg_fund.avg_fund_raised
-- FROM (
--     SELECT l.stage, SUM(funds_raised_millions) AS total_funds_millions 
--     FROM layoffs l 
--     GROUP BY l.stage
-- ) total_fund 
-- JOIN (
--     SELECT CAST(AVG(total_fund) AS SIGNED) AS avg_fund_raised 
--     FROM (
--         SELECT l.stage, SUM(funds_raised_millions) AS total_fund 
--         FROM layoffs l 
--         GROUP BY l.stage
--     ) x
-- ) avg_fund 
-- ON total_fund.total_funds_millions > avg_fund.avg_fund_raised;

WITH Total_sales (store_id, total_sales_per_store) AS
		(SELECT s.store.id, SUM(COST) AS total_sales_per_store
		FROM sales s
		GROUP BY s.store_id
	avg_sales (avg_sales_for_all_stores) AS
		(SELECT CAST(AVG(total_sales_store) AS SIGNED) AS avg_sales_for_sales
		FROM total_sales)
SELECT *
FROM total_sales ts
JOIN avg_sales av
ON ts.total_sales_per_store > av.avg_sales_for_all_stores

-- Subqueries
-- SELECT *
-- FROM (SELECT s.store_id, SUM(cost) AS total_sales_per_store
-- 	FROM sales s
--     GROUP BY s.store_id) total_sales
-- JOIN (SELECT CAST(AVG(total_sales_per_store) AS SIGNED) AS avg_sales_for_all_stores
-- 	FROM (SELECT s.store_id, SUM(cost) AS total_sales_per_store
-- 		  FROM sales s
--           GROUP BY s.store_id) x) avg_sales
-- 	ON total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_stores;


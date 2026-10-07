-- Where we can use sub query in sql

-- SELECT 
-- FROM
-- WHERE
-- HAVING

-- Using a subquery in SELECT clause
SELECT *,
		CASE
			WHEN total_laid_off > (SELECT AVG(total_laid_off) FROM layoffs)
					THEN 'Higher than average'
			ELSE NULL 
		END AS avg_total_laid_off
FROM layoffs;


SELECT *,
		CASE
			WHEN total_laid_off > avg_laid_off
				THEN 'Higher than average'
			ELSE NULL
		END AS remark
FROM layoffs
CROSS JOIN (SELECT AVG(total_laid_off) FROM layoffs) avg_laid_off;
        
        
-- HAVING 
SELECT industry, SUM(total_laid_off)
FROM layoffs
WHERE total_laid_off IS NOT NULL
GROUP BY industry;

SELECT industry, SUM(total_laid_off)
FROM layoffs
GROUP BY industry
HAVING SUM(total_laid_off) > (SELECT AVG(total_laid_off) FROM layoffs);

SELECT AVG(total_laid_off) FROM layoffs;






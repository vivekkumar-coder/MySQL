-- subqueries practice

SELECT DATABASE();

SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2;

SELECT AVG(funds_raised_millions)
FROM layoffs;

SELECT * -- outer query / main query
FROM layoffs
WHERE funds_raised_millions > 
	(SELECT AVG(funds_raised_millions)  -- subquery / inner query
    FROM layoffs);

-- Scalar subquery
-- It always return 1 row and 1 column.
SELECT *
FROM layoffs AS l
JOIN (SELECT AVG(funds_raised_millions) AS overall_avg FROM layoffs) AS avg_sal
	ON l.funds_raised_millions > avg_sal.overall_avg;
    
-- Multiple row subquery
-- subquery multiple which return  multiple column and multiple rows.
-- subquery which returns only 1 column and multiple rows.

SELECT 
	company, 
	SUM(total_laid_off)
FROM layoffs
GROUP BY company;

SELECT country, 
	industry, 
    company, 
    total_laid_off
FROM layoffs
WHERE (country, industry, company, total_laid_off) 
IN (
	SELECT country, industry, company, SUM(total_laid_off)
	FROM layoffs
    GROUP BY country, industry, company
);

SELECT country, total_laid_off
FROM layoffs
WHERE (country, total_laid_off)
IN (SELECT country, SUM(total_laid_off)
	FROM layoffs
    GROUP BY country
    ORDER BY country)
;

SELECT 
    country, 
    SUM(total_laid_off) 
FROM layoffs
GROUP BY country
ORDER BY country;


-- SINGLE column, multiple row subquery

SELECT * 
FROM layoffs
WHERE country NOT IN 
	(
		SELECT DISTINCT country
        FROM layoffs
	)
;

SELECT country
FROM layoffs
WHERE country NOT IN 
	(
		SELECT DISTINCT country
        FROM layoffs
	)
;

SELECT * FROM layoffs_staging;



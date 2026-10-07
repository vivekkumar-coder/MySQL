-- corelated subquery
-- A subquery which is related to the outer query
SELECT AVG(total_laid_off)  FROM layoffs l1  WHERE  l1.industry = l1.industry;

SELECT *
FROM layoffs l1
WHERE total_laid_off > (SELECT AVG(total_laid_off)
						FROM layoffs l2
                        WHERE  l1.industry = l2.industry);
                        
SELECT company, country, total_laid_off, stage
FROM layoffs l1
WHERE total_laid_off > (SELECT  AVG(total_laid_off)
						FROM layoffs L2
                        WHERE l1.industry=l2.industry
                        GROUP BY stage);

SELECT stage, company, country, total_laid_off
FROM layoffs l1
WHERE total_laid_off > (SELECT  AVG(total_laid_off)
						FROM layoffs L2
                        WHERE l1.stage =l2.stage
                        GROUP BY stage);

SELECT country, company, stage, total_laid_off, industry
FROM layoffs 
WHERE total_laid_off IS NOT NULL;

SELECT country, company, stage, total_laid_off, industry
FROM layoffs
WHERE total_laid_off IS NULL;

     
     
SELECT country, company, stage, total_laid_off, industry
FROM layoffs l1
WHERE NOT EXISTS (SELECT total_laid_off 
					FROM layoffs l2
                    WHERE l1.total_laid_off = l2.total_laid_off);

SELECT country, company, stage, total_laid_off, industry
FROM layoffs l1
WHERE EXISTS (SELECT total_laid_off
				FROM layoffs l2
                WHERE l1.total_laid_off = l2.total_laid_off
                ORDER BY total_laid_off DESC);
                
SELECT l1.country, l1.company, l1.stage, l1.total_laid_off, l1.industry
FROM layoffs l1
WHERE EXISTS (
    SELECT 1
    FROM layoffs l2
    WHERE l1.total_laid_off = l2.total_laid_off
      -- Ensures it's matching a DIFFERENT company, not itself
      AND l1.company <> l2.company 
)
AND l1.total_laid_off IS NOT NULL
ORDER BY l1.total_laid_off DESC;

SELECT 1 FROM layoffs l WHERE l.company = 'yahoo';
SELECT * FROM layoffs l WHERE l.company = 'yahoo';
SELECT * FROM layoffs l WHERE l.percentage_laid_off = l.percentage_laid_off;

SELECT *
FROM layoffs;
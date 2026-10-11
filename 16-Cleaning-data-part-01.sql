-- Data Cleaning

SELECT *
FROM layoffs;

-- 1.Remove Duplicates
-- 2.Standardise the Data
-- 3.Null Values or blank values
-- 4.Remove Any columns

DROP TABLE IF EXISTS layoffs_staging;

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num 
FROM layoffs_staging;

WITH duplicate_cte AS
(
		SELECT *,
		ROW_NUMBER() OVER(
			PARTITION BY 
				company, 
                location, 
                industry, 
                total_laid_off, 
                percentage_laid_off, 
                `date`,
                stage,
                country, 
                funds_raised_millions
		) AS row_num
    FROM layoffs_staging
)	
SELECT *
FROM duplicate_cte
WHERE row_num >1;

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

SELECT *
FROM layoffs_staging
WHERE company = 'Oda';

ALTER TABLE layoffs_staging
ADD COLUMN row_id INT AUTO_INCREMENT PRIMARY KEY;

WITH duplicate_cte AS
(
	SELECT *,
    ROW_NUMBER() OVER(
			PARTITION BY
			company, 
			location, 
			industry,
			total_laid_off,
			percentage_laid_off,
			`date`,
			stage,
			country, 
			funds_raised_millions
		ORDER BY row_id
	) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

DELETE FROM layoffs_staging
WHERE row_id IN
(
	SELECT row_id
    FROM
    (
		SELECT *,
		ROW_NUMBER() OVER(
				PARTITION BY
				company, 
				location, 
				industry,
				total_laid_off,
				percentage_laid_off,
				`date`,
				stage,
				country, 
				funds_raised_millions
			ORDER BY row_id
		) AS row_num
		FROM layoffs_staging
	) AS  duplicate_cte
WHERE row_num>1
);
        
SELECT *
FROM layoffs_staging;







DROP TABLE IF EXISTS layoffs_staging2;
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_id` int NOT NULL AUTO_INCREMENT,
  `row_num` INT,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2 (
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised_millions,
    row_num
)
SELECT
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised_millions,
    ROW_NUMBER() OVER (
        PARTITION BY
            company,
            location,
            industry,
            total_laid_off,
            percentage_laid_off,
            `date`,
            stage,
            country,
            funds_raised_millions
        ORDER BY company
    ) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE row_num>1;





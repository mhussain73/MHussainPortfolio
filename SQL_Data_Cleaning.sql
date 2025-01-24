SELECT *
FROM world_layoffs.dbo.layoffs_Default2
ORDER BY 1

--XXX CREATE COPY

--SELECT * 
--INTO world_layoffs.dbo.layoffs_Default
--FROM world_layoffs.dbo.layoffs

--XXX DELETE TABLE

--DROP TABLE Table_Name

--XXX DELETE DUPLICATES

--SELECT *
--FROM world_layoffs.dbo.layoffs_Default

--SELECT *, ROW_NUMBER() 
--OVER(PARTITION BY 
--company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions ORDER BY company) 
--AS Row_Num
--FROM world_layoffs.dbo.layoffs_Default
----X
--WITH storage_CTE AS
--(
--SELECT *, ROW_NUMBER() 
--OVER(PARTITION BY 
--company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions ORDER BY company) 
--AS Row_Num
--FROM world_layoffs.dbo.layoffs_Default
--)

--SELECT * FROM storage_CTE  -- DELETE FROM storage_CTE
--WHERE Row_Num > 1

--XXX Standardizing Data

--UPDATE world_layoffs.dbo.layoffs_Default
--SET company = TRIM(company)

--SELECT DISTINCT(industry)
--FROM world_layoffs.dbo.layoffs_Default
--WHERE industry LIKE 'crypto%'
--ORDER BY 1

--UPDATE world_layoffs.dbo.layoffs_Default
--SET location = 'Malmo'
--WHERE location LIKE 'malm%'

----SELECT DISTINCT(location)
--SELECT *
--FROM world_layoffs.dbo.layoffs_Default
--WHERE location LIKE 'malm%'
--ORDER BY 1

--SELECT DISTINCT(country)
----SELECT *
--FROM world_layoffs.dbo.layoffs_Default
--WHERE country LIKE 'United States%'
--ORDER BY 1

--XXX Fix Date

--UPDATE world_layoffs.dbo.layoffs_Default
--SET date = PARSE(date AS DATE)

--SELECT date--, PARSE(date AS DATE)
--FROM world_layoffs.dbo.layoffs_Default
--ORDER BY 1

--UPDATE world_layoffs.dbo.layoffs_Default
--SET date = NULL
--WHERE date ='1/1/1000'

--ALTER TABLE world_layoffs.dbo.layoffs_Default
--ALTER COLUMN date DATE

--UPDATE world_layoffs.dbo.layoffs_Default
--SET industry = NULL
--WHERE industry ='NULL' or industry =''

--SELECT company, industry
--FROM world_layoffs.dbo.layoffs_Default
--WHERE company IN 
--(SELECT company--, industry
--FROM world_layoffs.dbo.layoffs_Default
--WHERE industry IS NULL)

--SELECT *
--FROM world_layoffs.dbo.layoffs_Default t1
--JOIN world_layoffs.dbo.layoffs_Default t2
--ON t1.company = t2.company AND t1.location = t2.location
--WHERE t1.industry IS NULL AND t2.industry IS NOT NULL

--UPDATE t1
--SET t1.industry = t2.industry
--FROM world_layoffs.dbo.layoffs_Default t1
--JOIN world_layoffs.dbo.layoffs_Default t2					--UPDATE DATA USING SELF JOIN
--	ON t1.company = t2.company
--WHERE t1.industry IS NULL AND t2.industry IS NOT NULL

--UPDATE world_layoffs.dbo.layoffs_Default
--SET total_laid_off = NULL
--WHERE total_laid_off ='NULL' or total_laid_off =''

--UPDATE world_layoffs.dbo.layoffs_Default
--SET percentage_laid_off = NULL
--WHERE percentage_laid_off ='NULL' or percentage_laid_off =''

--XXX CREATE NEW COPY

--SELECT * 
--INTO world_layoffs.dbo.layoffs_Default2
--FROM world_layoffs.dbo.layoffs_Default

--XXXXXXXXX

--SELECT *
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL
--ORDER BY 1

--DELETE
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL

--XXXXXXXXX

--SELECT *
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE country = 'NULL' 
--	OR country = ''

--SELECT * 
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE stage = 'NULL'
--ORDER BY 1

--UPDATE world_layoffs.dbo.layoffs_Default2
--SET stage = NULL
--WHERE stage = 'NULL'

--SELECT * 
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE funds_raised_millions IS NULL
--ORDER BY 1

--UPDATE world_layoffs.dbo.layoffs_Default2
--SET funds_raised_millions = NULL
--WHERE funds_raised_millions = 'NULL'


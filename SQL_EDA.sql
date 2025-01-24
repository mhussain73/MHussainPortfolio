SELECT *
FROM world_layoffs.dbo.layoffs_Default2
ORDER BY 1

----XXX CHANGE DATA TYPES

----ALTER TABLE world_layoffs.dbo.layoffs_Default2
----ALTER COLUMN percentage_laid_off FLOAT(2)

----ALTER TABLE world_layoffs.dbo.layoffs_Default2
----ALTER COLUMN total_laid_off INT

----ALTER TABLE world_layoffs.dbo.layoffs_Default2
----ALTER COLUMN funds_raised_millions FLOAT(2)

----XXXXXXXXXXXXXXX
----LAYOFFS AT EACH COMPANY
--SELECT company, SUM(total_laid_off) AS LAYOFFS
--FROM world_layoffs.dbo.layoffs_Default2
--GROUP BY company
--ORDER BY 1

----LAYOFFS PER YEAR
--SELECT YEAR(date) AS EACH_YEAR, SUM(total_laid_off) AS LAYOFFS
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE YEAR(date) IS NOT NULL
--GROUP BY YEAR(date)
--ORDER BY 1

----LAYOFFS PER YEAR,MONTH
--SELECT FORMAT(date, 'yyyy-MM') AS EACH_MONTH, SUM(total_laid_off) AS LAYOFFS
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE FORMAT(date, 'yyyy-MM') IS NOT NULL
--GROUP BY FORMAT(date, 'yyyy-MM')
--ORDER BY 1

----ROLLING TOTAL ^
--SELECT t1.EACH_MONTH, t1.LAYOFFS, SUM(t2.LAYOFFS) AS Rolling_Total
--FROM (
--SELECT FORMAT(date, 'yyyy-MM') AS EACH_MONTH, SUM(total_laid_off) AS LAYOFFS
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE FORMAT(date, 'yyyy-MM') IS NOT NULL
--GROUP BY FORMAT(date, 'yyyy-MM')
--) AS t1
--JOIN (
--SELECT FORMAT(date, 'yyyy-MM') AS EACH_MONTH, SUM(total_laid_off) AS LAYOFFS
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE FORMAT(date, 'yyyy-MM') IS NOT NULL
--GROUP BY FORMAT(date, 'yyyy-MM')
--) AS t2
--ON t1.EACH_MONTH >= t2.EACH_MONTH
--GROUP BY t1.EACH_MONTH, t1.LAYOFFS
--ORDER BY 1

----Total Before Layoff
--SELECT *, ROUND(total_laid_off/percentage_laid_off, 0) AS 'TBL+-' 
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE total_laid_off IS NOT NULL
--	AND percentage_laid_off IS NOT NULL AND percentage_laid_off > 0 

----Total Funds Raised By Each Company In Each Country
--SELECT country, company, ROUND(SUM(funds_raised_millions), 2) AS Amount_Raised_Mills
--FROM world_layoffs.dbo.layoffs_Default2
--WHERE funds_raised_millions IS NOT NULL
--GROUP BY country, company
--ORDER BY 1
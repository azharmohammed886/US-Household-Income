#US HOUSEHOLD INCOME

SELECT * FROM us_project.us_household_income;
SELECT * FROM us_project.ushousehold_income_statistics
;
ALTER TABLE us_project.ushousehold_income_statistics RENAME column `ï»¿id` TO `id`   ;

SELECT COUNT(id)
FROM us_household_income;

SELECT COUNT(id)
FROM ushousehold_income_statistics;


SELECT *
FROM us_household_income;

SELECT *
FROM ushousehold_income_statistics;


SELECT id, COUNT(id)
FROM us_household_income
GROUP BY ID
HAVING COUNT(id) > 1;


SELECT id, COUNT(id)
FROM ushousehold_income_statistics;



 


DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id, Id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM us_household_income) AS Duplicates
WHERE row_num > 1);


DELETE FROM us_project.us_household_income_statistics
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id, Id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM us_project.us_household_income_statistics) AS Duplicates
WHERE row_num > 1);


SELECT id, COUNT(id)
FROM us_project.us_household_income_statistics
GROUP BY id;


SELECT DISTINCT state_name
FROM us_project.us_household_income
GROUP BY state_name
ORDER BY 1 ;

UPDATE us_project.us_household_income
SET state_name = 'Alabama'
WHERE state_name = 'alabama';


SELECT *
FROM us_project.us_household_income
WHERE Place = 'Autaunga County'
ORDER BY 1 ;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT TYPE, COUNT(TYPE)
FROM us_project.us_household_income
GROUP BY Type;

UPDATE us_household_income
SET TYPE = 'Borough'
WHERE TYPE = 'Boroughs';

SELECT *
FROM us_project.us_household_income;

SELECT AWater, ALand
FROM us_project.us_household_income
WHERE  (ALand = 0 OR ALand = '' OR ALand IS NULL);





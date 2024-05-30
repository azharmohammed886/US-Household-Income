#US DATA EDA

SELECT *
 FROM us_project.us_household_income;
SELECT * 
FROM us_project.us_household_income_statistics;

SELECT state_name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY state_name
ORDER BY 2 ;
ORDER BY 2 ;
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

# 2. JOINING THE TWO TABLES ON ID (Based on foreign and primary key)
SELECT *
FROM us_household_income AS u
INNER JOIN us_household_income_statistics AS us
ON u.id = us.id
ORDER BY u.state_name;


# 3 FINDING relation between the avg(mean) BASED ON THEIR  state_name and CITIES
    SELECT u.State_Name, City, ROUND(Avg(mean), 1)
    FROM us_household_income AS u
INNER JOIN us_household_income_statistics AS us
ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name, City
ORDER BY ROUND(Avg(mean), 1) DESC
;

#4
SELECT Type, COUNT(TYPE), ROUND(AVG(Mean),2), ROUND(AVG(Median), 2)
    FROM us_project.us_household_income u
	INNER JOIN us_project.us_household_income_statistics us
    ON u.id = us.id
    WHERE Mean <> 0
    GROUP BY 1
	ORDER BY 2 DESC
    LIMIT 20;
    
    SELECT *
    FROM us_household_income
    WHERE TYPE = 'City';
    
    # 5. Finding relation between the categorical data based on state, state vs avg(mean) vs avg(median) BETWEEN TWO columns
SELECT u.State_Name, ROUND(AVG(Mean),2), ROUND(AVG(Median), 2)
    FROM us_project.us_household_income u
	INNER JOIN us_project.us_household_income_statistics us
    ON u.id = us.id
    WHERE Mean <> 0
    GROUP BY u.State_Name
      ORDER BY 3 DESC
      LIMIT 5
;

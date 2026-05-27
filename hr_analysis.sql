-- HR Analytics - Attrition Analysis
-- Author: Gaurav Raghuvanshi

-- 1. Total Employees & Attrition Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data;

-- 2. Attrition by Department
SELECT 
    Department,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate DESC;

-- 3. Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Above 45'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_data
GROUP BY age_group
ORDER BY attrition DESC;

-- 4. High Risk Employees
SELECT 
    JobRole,
    MonthlyIncome,
    YearsAtCompany,
    OverTime,
    Attrition
FROM hr_data
WHERE Attrition = 'Yes'
AND OverTime = 'Yes'
ORDER BY MonthlyIncome ASC;

-- 5. Average Income by Job Role
SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS avg_income,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY JobRole
ORDER BY avg_income DESC;
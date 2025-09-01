
-- ===============================================
-- HR Analytics Project for Adviti Pvt. Ltd.
-- SQL Analysis Script
-- ===============================================

-- ===============================================
-- OBJECTIVE 1: Understanding Drivers of Attrition
-- ===============================================

-- 1. Attrition by Position
SELECT Position,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Position
ORDER BY Attrition_Percent DESC;

-- 2. Attrition by Department
SELECT Department,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Department
ORDER BY Attrition_Percent DESC;

-- 3. Attrition by Gender
SELECT Gender,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Gender
ORDER BY Attrition_Percent DESC;

-- 4. Attrition vs Job Satisfaction (Example: Work-Life Balance)
SELECT JobSatisfaction_WorkLifeBalance AS Satisfied,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY JobSatisfaction_WorkLifeBalance;

-- Repeat similar queries for:
-- JobSatisfaction_PeerRelationship
-- JobSatisfaction_Compensation
-- JobSatisfaction_Management
-- JobSatisfaction_JobSecurity

-- 5. Attrition vs Performance Rating
SELECT Performance_Rating,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Performance_Rating
ORDER BY Performance_Rating;

-- 6. Attrition vs Years of Service
SELECT Years_of_Service,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Years_of_Service
ORDER BY Years_of_Service;

-- 7. Attrition vs Promotion
SELECT Promotion,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Promotion;

-- 8. Attrition vs Benefits (Example: Health Insurance)
SELECT EmployeeBenefit_HealthInsurance,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY EmployeeBenefit_HealthInsurance;

-- Repeat similar queries for:
-- EmployeeBenefit_PaidLeave
-- EmployeeBenefit_RetirementPlan
-- EmployeeBenefit_GymMembership
-- EmployeeBenefit_ChildCare

-- 9. Attrition vs Age Group (Grouped Example)
SELECT CASE 
           WHEN Age BETWEEN 21 AND 25 THEN '21-25'
           WHEN Age BETWEEN 26 AND 30 THEN '26-30'
           WHEN Age BETWEEN 31 AND 35 THEN '31-35'
           WHEN Age BETWEEN 36 AND 40 THEN '36-40'
           ELSE '41+'
       END AS Age_Group,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Age_Group
ORDER BY Age_Group;

-- 10. Attrition vs Distance from Work (Grouped)
SELECT CASE 
           WHEN Distance_from_Work <= 5 THEN '0-5 km'
           WHEN Distance_from_Work <= 10 THEN '6-10 km'
           WHEN Distance_from_Work <= 20 THEN '11-20 km'
           WHEN Distance_from_Work <= 50 THEN '21-50 km'
           ELSE '50+ km'
       END AS Distance_Group,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Distance_Group
ORDER BY Distance_Group;

-- 11. Attrition vs Absenteeism (Grouped)
SELECT CASE 
           WHEN Absenteeism <= 5 THEN '0-5 days'
           WHEN Absenteeism <= 10 THEN '6-10 days'
           WHEN Absenteeism <= 20 THEN '11-20 days'
           ELSE '21+ days'
       END AS Absenteeism_Group,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percent
FROM hr_data_updated
GROUP BY Absenteeism_Group
ORDER BY Absenteeism_Group;


-- ===============================================
-- OBJECTIVE 2: Measuring Employee Engagement
-- ===============================================

-- 1. Engagement Score Distribution
SELECT Employee_Engagement_Score,
       COUNT(*) AS Count
FROM hr_data_updated
GROUP BY Employee_Engagement_Score
ORDER BY Employee_Engagement_Score;

-- 2. Average Engagement by Department
SELECT Department,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY Department
ORDER BY Avg_Engagement DESC;

-- 3. Average Engagement by Position
SELECT Position,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY Position
ORDER BY Avg_Engagement DESC;

-- 4. Average Engagement by Work Hours Group
SELECT CASE 
           WHEN Work_Hours <= 40 THEN '<=40 hrs'
           WHEN Work_Hours <= 45 THEN '41-45 hrs'
           WHEN Work_Hours <= 50 THEN '46-50 hrs'
           ELSE '51+ hrs'
       END AS Work_Hours_Group,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY Work_Hours_Group
ORDER BY Work_Hours_Group;

-- 5. Engagement vs Job Satisfaction (Example: Compensation)
SELECT JobSatisfaction_Compensation,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY JobSatisfaction_Compensation;

-- Repeat for other satisfaction dimensions:
-- JobSatisfaction_PeerRelationship
-- JobSatisfaction_WorkLifeBalance
-- JobSatisfaction_Management
-- JobSatisfaction_JobSecurity

-- 6. Engagement vs Benefits (Example: Gym Membership)
SELECT EmployeeBenefit_GymMembership,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY EmployeeBenefit_GymMembership;

-- Repeat for other benefits:
-- EmployeeBenefit_HealthInsurance
-- EmployeeBenefit_PaidLeave
-- EmployeeBenefit_RetirementPlan
-- EmployeeBenefit_ChildCare

-- 7. Engagement vs Absenteeism Group
SELECT CASE 
           WHEN Absenteeism <= 5 THEN '0-5 days'
           WHEN Absenteeism <= 10 THEN '6-10 days'
           WHEN Absenteeism <= 20 THEN '11-20 days'
           ELSE '21+ days'
       END AS Absenteeism_Group,
       ROUND(AVG(Employee_Engagement_Score), 2) AS Avg_Engagement
FROM hr_data_updated
GROUP BY Absenteeism_Group
ORDER BY Absenteeism_Group;


-- ===============================================
-- OBJECTIVE 3: Analyzing Training Outcomes
-- ===============================================

-- 1. Average Training Hours by Department
SELECT Department,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Department
ORDER BY Avg_Training_Hours DESC;

-- 2. Average Training Hours by Performance Rating
SELECT Performance_Rating,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Performance_Rating
ORDER BY Performance_Rating;

-- 3. Training vs Promotion
SELECT Promotion,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Promotion;

-- 4. Training vs Attrition
SELECT Attrition,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Attrition;

-- 5. Training vs Engagement Score
SELECT Employee_Engagement_Score,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Employee_Engagement_Score
ORDER BY Employee_Engagement_Score;

-- 6. Training vs Performance Rating
SELECT Performance_Rating,
       ROUND(AVG(Training_Hours), 2) AS Avg_Training_Hours
FROM hr_data_updated
GROUP BY Performance_Rating
ORDER BY Performance_Rating;

-- ===============================================
-- END OF SCRIPT
-- ===============================================

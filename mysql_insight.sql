CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;
-- ========================================
-- HOSPITAL PATIENT DATA ANALYSIS
-- SQL QUERIES FOR INSIGHTS
-- ========================================

-- Before running these queries, import your cleaned CSV into SQL database
-- CREATE TABLE syntax (use this to create your table first):

/*
CREATE TABLE hospital_patients (
    Patient_ID VARCHAR(10),
    Patient_Name VARCHAR(100),
    Age INT,
    Age_Group VARCHAR(20),
    Gender VARCHAR(10),
    Blood_Group VARCHAR(5),
    Admission_Date DATE,
    Admission_Year INT,
    Admission_Month INT,
    Admission_Month_Name VARCHAR(20),
    Admission_Quarter INT,
    Discharge_Date DATE,
    Days_Stayed INT,
    Stay_Category VARCHAR(20),
    Department VARCHAR(50),
    Doctor_Name VARCHAR(100),
    Diagnosis VARCHAR(100),
    Admission_Type VARCHAR(50),
    Discharge_Status VARCHAR(50),
    Follow_Up_Required VARCHAR(10),
    Treatment_Cost DECIMAL(10,2),
    Insurance_Type VARCHAR(50),
    Insurance_Coverage_Percent DECIMAL(5,2),
    Insurance_Paid DECIMAL(10,2),
    Out_Of_Pocket_Cost DECIMAL(10,2),
    Medication_Prescribed INT,
    Lab_Tests_Count INT
);
*/

-- ========================================
-- 1. OVERALL HOSPITAL PERFORMANCE METRICS
-- ========================================

-- Total patients, revenue, and average costs
SELECT 
    COUNT(DISTINCT Patient_ID) AS Total_Patients,
    COUNT(*) AS Total_Admissions,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    SUM(Insurance_Paid) AS Total_Insurance_Paid,
    SUM(Out_Of_Pocket_Cost) AS Total_Out_Of_Pocket,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Days_Stayed) AS Total_Patient_Days
FROM hospital_patients;


-- ========================================
-- 2. REVENUE ANALYSIS BY DEPARTMENT
-- ========================================

SELECT 
    Department,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Revenue_Per_Patient,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Treatment_Cost) / SUM(Days_Stayed) AS Revenue_Per_Day,
    ROUND(100.0 * SUM(Treatment_Cost) / (SELECT SUM(Treatment_Cost) FROM hospital_patients), 2) AS Revenue_Percentage
FROM hospital_patients
GROUP BY Department
ORDER BY Total_Revenue DESC;


-- ========================================
-- 3. MONTHLY TREND ANALYSIS
-- ========================================

SELECT 
    Admission_Year,
    Admission_Month,
    Admission_Month_Name,
    COUNT(*) AS Total_Admissions,
    SUM(Treatment_Cost) AS Monthly_Revenue,
    AVG(Treatment_Cost) AS Avg_Cost_Per_Patient,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) AS Successful_Discharges
FROM hospital_patients
GROUP BY Admission_Year, Admission_Month, Admission_Month_Name
ORDER BY Admission_Year, Admission_Month;


-- ========================================
-- 4. DOCTOR PERFORMANCE ANALYSIS
-- ========================================

SELECT 
    Doctor_Name,
    Department,
    COUNT(*) AS Total_Patients_Treated,
    SUM(Treatment_Cost) AS Total_Revenue_Generated,
    AVG(Treatment_Cost) AS Avg_Revenue_Per_Patient,
    AVG(Days_Stayed) AS Avg_Patient_Stay,
    COUNT(CASE WHEN Follow_Up_Required = 'Yes' THEN 1 END) AS Follow_Ups_Required,
    ROUND(100.0 * COUNT(CASE WHEN Follow_Up_Required = 'Yes' THEN 1 END) / COUNT(*), 2) AS Follow_Up_Rate
FROM hospital_patients
GROUP BY Doctor_Name, Department
ORDER BY Total_Revenue_Generated DESC;


-- ========================================
-- 5. INSURANCE TYPE ANALYSIS
-- ========================================

SELECT 
    Insurance_Type,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Total_Treatment_Cost,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    AVG(Insurance_Coverage_Percent) AS Avg_Coverage_Percent,
    SUM(Insurance_Paid) AS Total_Insurance_Paid,
    SUM(Out_Of_Pocket_Cost) AS Total_Out_Of_Pocket,
    AVG(Out_Of_Pocket_Cost) AS Avg_Out_Of_Pocket_Per_Patient
FROM hospital_patients
GROUP BY Insurance_Type
ORDER BY Total_Patients DESC;


-- ========================================
-- 6. AGE GROUP DEMOGRAPHICS & COSTS
-- ========================================

SELECT 
    Age_Group,
    Gender,
    COUNT(*) AS Patient_Count,
    AVG(Age) AS Avg_Age,
    SUM(Treatment_Cost) AS Total_Treatment_Cost,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Medication_Prescribed) AS Total_Medications,
    SUM(Lab_Tests_Count) AS Total_Lab_Tests
FROM hospital_patients
GROUP BY Age_Group, Gender
ORDER BY Age_Group, Gender;


-- ========================================
-- 7. DIAGNOSIS ANALYSIS
-- ========================================

SELECT 
    Diagnosis,
    Department,
    COUNT(*) AS Total_Cases,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    AVG(Days_Stayed) AS Avg_Recovery_Days,
    AVG(Medication_Prescribed) AS Avg_Medications,
    AVG(Lab_Tests_Count) AS Avg_Lab_Tests,
    COUNT(CASE WHEN Follow_Up_Required = 'Yes' THEN 1 END) AS Requires_Follow_Up
FROM hospital_patients
GROUP BY Diagnosis, Department
ORDER BY Total_Cases DESC
LIMIT 15;


-- ========================================
-- 8. ADMISSION TYPE ANALYSIS
-- ========================================

SELECT 
    Admission_Type,
    COUNT(*) AS Total_Admissions,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    SUM(Treatment_Cost) AS Total_Revenue,
    COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) AS Successful_Discharges,
    ROUND(100.0 * COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) / COUNT(*), 2) AS Success_Rate
FROM hospital_patients
GROUP BY Admission_Type
ORDER BY Total_Admissions DESC;


-- ========================================
-- 9. LENGTH OF STAY ANALYSIS
-- ========================================

SELECT 
    Stay_Category,
    COUNT(*) AS Total_Patients,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Days_Stayed) AS Avg_Days,
    MIN(Days_Stayed) AS Min_Days,
    MAX(Days_Stayed) AS Max_Days
FROM hospital_patients
GROUP BY Stay_Category
ORDER BY 
    CASE Stay_Category
        WHEN 'Short (1-3)' THEN 1
        WHEN 'Medium (4-7)' THEN 2
        WHEN 'Long (8-14)' THEN 3
        WHEN 'Extended (15+)' THEN 4
    END;


-- ========================================
-- 10. DISCHARGE STATUS ANALYSIS
-- ========================================

SELECT 
    Discharge_Status,
    COUNT(*) AS Total_Patients,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM hospital_patients), 2) AS Percentage
FROM hospital_patients
GROUP BY Discharge_Status
ORDER BY Total_Patients DESC;


-- ========================================
-- 11. QUARTERLY PERFORMANCE COMPARISON
-- ========================================

SELECT 
    Admission_Year,
    Admission_Quarter,
    COUNT(*) AS Total_Admissions,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Revenue_Per_Patient,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    COUNT(DISTINCT Department) AS Active_Departments,
    COUNT(DISTINCT Doctor_Name) AS Active_Doctors
FROM hospital_patients
GROUP BY Admission_Year, Admission_Quarter
ORDER BY Admission_Year, Admission_Quarter;


-- ========================================
-- 12. TOP 10 MOST PROFITABLE PATIENTS
-- ========================================

SELECT 
    Patient_ID,
    Patient_Name,
    Age,
    Gender,
    Department,
    Diagnosis,
    Treatment_Cost,
    Days_Stayed,
    Admission_Date,
    Discharge_Status
FROM hospital_patients
ORDER BY Treatment_Cost DESC
LIMIT 10;


-- ========================================
-- 13. DEPARTMENT EFFICIENCY METRICS
-- ========================================

SELECT 
    Department,
    COUNT(*) AS Total_Patients,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Treatment_Cost) / SUM(Days_Stayed) AS Revenue_Per_Day,
    AVG(Medication_Prescribed) AS Avg_Medications_Per_Patient,
    AVG(Lab_Tests_Count) AS Avg_Lab_Tests_Per_Patient,
    COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) AS Successful_Discharges,
    ROUND(100.0 * COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) / COUNT(*), 2) AS Success_Rate
FROM hospital_patients
GROUP BY Department
ORDER BY Revenue_Per_Day DESC;


-- ========================================
-- 14. BLOOD GROUP DISTRIBUTION
-- ========================================

SELECT 
    Blood_Group,
    COUNT(*) AS Total_Patients,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM hospital_patients), 2) AS Percentage,
    AVG(Age) AS Avg_Age,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost
FROM hospital_patients
GROUP BY Blood_Group
ORDER BY Total_Patients DESC;


-- ========================================
-- 15. YEAR-OVER-YEAR COMPARISON
-- ========================================

SELECT 
    Admission_Year,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Total_Revenue,
    AVG(Treatment_Cost) AS Avg_Cost_Per_Patient,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Insurance_Paid) AS Total_Insurance_Paid,
    SUM(Out_Of_Pocket_Cost) AS Total_Out_Of_Pocket
FROM hospital_patients
GROUP BY Admission_Year
ORDER BY Admission_Year;


-- ========================================
-- 16. HIGH-COST PATIENTS ANALYSIS
-- ========================================

-- ========================================
-- 17. PATIENT READMISSION ANALYSIS
-- ========================================

-- Patients with multiple admissions (same name)
SELECT 
    Patient_Name,
    COUNT(*) AS Total_Admissions,
    SUM(Treatment_Cost) AS Total_Cost,
    AVG(Days_Stayed) AS Avg_Stay_Per_Admission,
    MIN(Admission_Date) AS First_Admission,
    MAX(Admission_Date) AS Last_Admission
FROM hospital_patients
GROUP BY Patient_Name
HAVING COUNT(*) > 1
ORDER BY Total_Admissions DESC, Total_Cost DESC;

WITH ranked_patients AS (
    SELECT 
        Patient_ID,
        Patient_Name,
        Age,
        Department,
        Diagnosis,
        Treatment_Cost,
        Days_Stayed,
        Insurance_Type,
        Out_Of_Pocket_Cost,
        NTILE(4) OVER (ORDER BY Treatment_Cost) AS quartile
    FROM hospital_patients
)
SELECT *
FROM ranked_patients
WHERE quartile = 4
ORDER BY Treatment_Cost DESC;
-- ========================================
-- 18. EMERGENCY VS ELECTIVE ADMISSIONS
-- ========================================

SELECT 
    CASE 
        WHEN Admission_Type = 'Emergency' THEN 'Emergency'
        ELSE 'Non-Emergency'
    END AS Admission_Category,
    COUNT(*) AS Total_Admissions,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay,
    SUM(Treatment_Cost) AS Total_Revenue,
    COUNT(CASE WHEN Discharge_Status = 'Discharged' THEN 1 END) AS Successful_Outcomes
FROM hospital_patients
GROUP BY 
    CASE 
        WHEN Admission_Type = 'Emergency' THEN 'Emergency'
        ELSE 'Non-Emergency'
    END;


-- ========================================
-- 19. DEPARTMENT WORKLOAD BY MONTH
-- ========================================

SELECT 
    Department,
    Admission_Month_Name,
    COUNT(*) AS Total_Patients,
    SUM(Treatment_Cost) AS Monthly_Revenue,
    AVG(Days_Stayed) AS Avg_Length_Of_Stay
FROM hospital_patients
GROUP BY Department, Admission_Month, Admission_Month_Name
ORDER BY Department, Admission_Month;


-- ========================================
-- 20. COMPREHENSIVE HOSPITAL SUMMARY
-- ========================================
-- 20. COMPREHENSIVE HOSPITAL SUMMARY (MySQL-compatible)
SELECT 
    'Total Patients' AS Metric, 
    CAST(COUNT(*) AS CHAR) AS Value
FROM hospital_patients

UNION ALL

SELECT 
    'Total Revenue' AS Metric,
    CONCAT('$', FORMAT(SUM(Treatment_Cost), 2)) AS Value
FROM hospital_patients

UNION ALL

SELECT 
    'Average Patient Cost' AS Metric,
    CONCAT('$', FORMAT(AVG(Treatment_Cost), 2)) AS Value
FROM hospital_patients

UNION ALL

SELECT 
    'Average Length of Stay' AS Metric,
    CONCAT(FORMAT(AVG(Days_Stayed), 1), ' days') AS Value
FROM hospital_patients

UNION ALL

SELECT 
    'Total Patient Days' AS Metric,
    CAST(SUM(Days_Stayed) AS CHAR) AS Value
FROM hospital_patients

UNION ALL

SELECT 
    'Most Common Department' AS Metric,
    Department AS Value
FROM (
    SELECT Department
    FROM hospital_patients
    GROUP BY Department
    ORDER BY COUNT(*) DESC
    LIMIT 1
) AS subq

UNION ALL

SELECT 
    'Highest Revenue Department' AS Metric,
    Department AS Value
FROM (
    SELECT Department
    FROM hospital_patients
    GROUP BY Department
    ORDER BY SUM(Treatment_Cost) DESC
    LIMIT 1
) AS subq;

-- ========================================
-- END OF SQL QUERIES
-- ========================================
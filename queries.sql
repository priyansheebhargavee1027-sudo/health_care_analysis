
-- Healthcare Patient Risk & Readmission Analysis
-- SQL Queries Used in Project



-- 1. Total Patients
SELECT COUNT(*) AS total_patients
FROM patients;


-- 2. Average Risk Score
SELECT AVG(risk_score) AS avg_risk_score
FROM patients;


-- 3. Average Hospital Stay
SELECT AVG(days_in_hospital) AS avg_hospital_stay
FROM patients;


-- 4. Readmission Rate (%)
SELECT 
    (SUM(CASE WHEN readmitted = 'YES' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*) AS readmission_rate
FROM patients;


-- 5. Patients by Risk Level
SELECT 
    risk_level,
    COUNT(*) AS patient_count
FROM patients
GROUP BY risk_level
ORDER BY patient_count DESC;


-- 6. Readmission by Risk Level
SELECT 
    risk_level,
    readmitted,
    COUNT(*) AS count
FROM patients
GROUP BY risk_level, readmitted
ORDER BY risk_level;


-- 7. Diagnosis-wise Patient Distribution
SELECT 
    primary_diagnosis,
    COUNT(*) AS patient_count
FROM patients
GROUP BY primary_diagnosis
ORDER BY patient_count DESC;


-- 8. Gender Distribution
SELECT 
    gender,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender;


-- 9. Risk Score vs Age (for scatter plot)
SELECT 
    age,
    risk_score
FROM patients;


-- 10. Readmission Count
SELECT 
    readmitted,
    COUNT(*) AS count
FROM patients
GROUP BY readmitted;


-- 11. Average Risk Score by Gender
SELECT 
    gender,
    AVG(risk_score) AS avg_risk
FROM patients
GROUP BY gender;


-- 12. High Risk Patients Only
SELECT *
FROM patients
WHERE risk_level = 'High Risk';


-- 13. Patients with Long Hospital Stay (>10 days)
SELECT *
FROM patients
WHERE days_in_hospital > 10;


-- 14. Readmitted High Risk Patients
SELECT *
FROM patients
WHERE risk_level = 'High Risk'
AND readmitted = 'YES';


-- ============================================

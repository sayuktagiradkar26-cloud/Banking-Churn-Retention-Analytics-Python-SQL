USE BankingChurnDB;

-- 1. Churn by age group
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age >= 51 THEN '51+'
        ELSE 'Other'
    END AS AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY AgeGroup
ORDER BY MIN(Age);

-- 2. Churn by geography
SELECT
    Geography,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY Geography
ORDER BY ChurnRatePercentage DESC;

-- 3. Churn by gender
SELECT
    Gender,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY Gender
ORDER BY ChurnRatePercentage DESC;

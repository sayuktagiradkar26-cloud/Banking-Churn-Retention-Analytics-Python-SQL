USE BankingChurnDB;

-- 1. Active vs inactive members
SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS MembershipStatus,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY IsActiveMember
ORDER BY ChurnRatePercentage DESC;

-- 2. Churn by number of products
SELECT
    NumOfProducts,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- 3. Churn by credit card
SELECT
    HasCrCard,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY HasCrCard;

-- 4. Churn by tenure
SELECT
    Tenure,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY Tenure
ORDER BY Tenure;

-- 5. Churn by balance group
SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance <= 50000 THEN '1-50000'
        WHEN Balance <= 100000 THEN '50001-100000'
        WHEN Balance <= 150000 THEN '100001-150000'
        ELSE 'Above 150000'
    END AS BalanceGroup,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY BalanceGroup
ORDER BY MIN(Balance);

-- 6. Churn by salary group
SELECT
    CASE
        WHEN EstimatedSalary < 30000 THEN 'Below 30000'
        WHEN EstimatedSalary < 60000 THEN '30000-59999'
        WHEN EstimatedSalary < 100000 THEN '60000-99999'
        ELSE '100000 and Above'
    END AS SalaryGroup,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY SalaryGroup
ORDER BY MIN(EstimatedSalary);

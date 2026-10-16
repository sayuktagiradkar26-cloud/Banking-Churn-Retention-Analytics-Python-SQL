USE BankingChurnDB;

-- 1. Highest churn geographies
SELECT
    Geography,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
GROUP BY Geography
ORDER BY ChurnRatePercentage DESC;

-- 2. Inactive customers
SELECT
    COUNT(*) AS InactiveCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
WHERE IsActiveMember = 0;

-- 3. Customers aged 51+
SELECT
    COUNT(*) AS CustomersAge51Plus,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
WHERE Age >= 51;

-- 4. Customers with 3 or more products
SELECT
    NumOfProducts,
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    ROUND(100.0 * AVG(Exited), 2) AS ChurnRatePercentage
FROM BankCustomers
WHERE NumOfProducts >= 3
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

USE BankingChurnDB;

SELECT
    COUNT(*) AS TotalCustomers,
    SUM(Exited = 1) AS ChurnedCustomers,
    SUM(Exited = 0) AS RetainedCustomers,
    ROUND(100.0 * SUM(Exited = 1) / COUNT(*), 2)
        AS ChurnRatePercentage
FROM BankCustomers;

CREATE DATABASE BankingChurnDB;
USE BankingChurnDB;

-- 1. Total customers
SELECT COUNT(*) AS TotalCustomers
FROM BankCustomers;

-- 2. Table structure
DESCRIBE BankCustomers;

-- 3. First 5 rows
SELECT *
FROM BankCustomers
LIMIT 5;

-- 4. Unique customer IDs
SELECT COUNT(DISTINCT CustomerId) AS UniqueCustomers
FROM BankCustomers;

-- 5. Missing customer IDs
SELECT COUNT(*) AS MissingCustomerIDs
FROM BankCustomers
WHERE CustomerId IS NULL;

-- 6. Duplicate customer IDs
SELECT CustomerId, COUNT(*) AS IDCount
FROM BankCustomers
GROUP BY CustomerId
HAVING COUNT(*) > 1;

-- 7. Missing values in important columns
SELECT
    SUM(Geography IS NULL) AS MissingGeography,
    SUM(Gender IS NULL) AS MissingGender,
    SUM(Age IS NULL) AS MissingAge,
    SUM(Exited IS NULL) AS MissingExited
FROM BankCustomers;

-- 8. Churn distribution
SELECT Exited, COUNT(*) AS CustomerCount
FROM BankCustomers
GROUP BY Exited
ORDER BY Exited;

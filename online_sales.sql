CREATE DATABASE online_sales;
USE online_sales;
CREATE TABLE Customer (
    customer_id INTEGER,
    gender TEXT,
    dob DATE,
    city_code INTEGER,
    registration_date DATE
);

CREATE TABLE prod_cat_info (
    prod_cat_code INTEGER,
    prod_sub_cat_code INTEGER,
    prod_cat TEXT,
    prod_subcat TEXT
);

CREATE TABLE Transactions (
    transaction_id INTEGER,
    cust_id INTEGER,
    tran_date DATE,
    prod_subcat_code INTEGER,
    prod_cat_code INTEGER,
    qty INTEGER,
    rate FLOAT,
    tax FLOAT,
    total_amt FLOAT,
    store_type TEXT
);

SELECT
    EXTRACT(YEAR FROM tran_date) AS year,
    EXTRACT(MONTH FROM tran_date) AS month,
    SUM(total_amt) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM
    Transactions
GROUP BY
    EXTRACT(YEAR FROM tran_date),
    EXTRACT(MONTH FROM tran_date)
ORDER BY
    year,
    month;

SELECT
    EXTRACT(YEAR FROM tran_date) AS year,
    EXTRACT(MONTH FROM tran_date) AS month,
    SUM(total_amt) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM
    Transactions
    WHERE
    EXTRACT(YEAR FROM tran_date) = 2014
GROUP BY
    EXTRACT(YEAR FROM tran_date),
    EXTRACT(MONTH FROM tran_date)
ORDER BY
    year,
    month;
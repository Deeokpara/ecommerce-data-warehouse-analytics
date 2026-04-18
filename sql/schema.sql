-- =========================
-- CREATE TABLES (STAR SCHEMA)
-- =========================

-- FACT TABLE (Main business data)
CREATE TABLE sales (
    sales_id SERIAL PRIMARY KEY,
    invoice_no TEXT,
    customer_id INT,
    product_id TEXT,
    quantity INT,
    unit_price FLOAT,
    revenue FLOAT,
    invoice_date TIMESTAMP
);

-- DIMENSION: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country TEXT
);

-- DIMENSION: Products
CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    description TEXT,
    unit_price FLOAT
);

-- DIMENSION: Date (Optional but ELITE)
CREATE TABLE dates (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);
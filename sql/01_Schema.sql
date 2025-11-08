-- Create DB for coffeeShop

IF DB_ID('CoffeeKioskDB') IS NULL
    CREATE DATABASE CoffeeKioskDB;
GO
USE CoffeeKioskDB;
GO

-- Dedicated schema

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name='ck')
    EXEC('CREATE SCHEMA ck');
GO

-- Customers
IF OBJECT_ID('ck.customer') IS NOT NULL DROP TABLE ck.customer;
CREATE TABLE ck.customer (
    customer_id     INT IDENTITY(1,1) PRIMARY KEY,
    name            NVARCHAR(100) NOT NULL,
    email           NVARCHAR(200) UNIQUE,
    sign_up_date    DATE NOT NULL DEFAULT (CAST(GETDATE() AS date))
);

-- Products
IF OBJECT_ID('ck.product') IS NOT NULL DROP TABLE ck.product;
CREATE TABLE ck.product (
    product_id  INT IDENTITY(1,1) PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    category    NVARCHAR(50)  NOT NULL,         -- e.g., Coffee, Tea, Pastry
    unit_cost   DECIMAL(10,2) NOT NULL CHECK (unit_cost >= 0),
    unit_price  DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    is_active   BIT NOT NULL DEFAULT(1),
    CONSTRAINT CK_product_margin CHECK (unit_price >= unit_cost)
);

-- Orders
IF OBJECT_ID('ck.orders') IS NOT NULL DROP TABLE ck.orders;
CREATE TABLE ck.orders (
    order_id     INT IDENTITY(1,1) PRIMARY KEY,
    customer_id  INT NOT NULL,
    order_date   DATE NOT NULL DEFAULT (CAST(GETDATE() AS date)),
    status       NVARCHAR(20) NOT NULL DEFAULT('Completed'), -- Completed|Pending|Cancelled
    CONSTRAINT FK_orders_customer FOREIGN KEY (customer_id) REFERENCES ck.customer(customer_id)
);

-- Order items
IF OBJECT_ID('ck.order_item') IS NOT NULL DROP TABLE ck.order_item;
CREATE TABLE ck.order_item (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL CHECK (quantity > 0),
    unit_price    DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    line_subtotal AS (quantity * unit_price) PERSISTED,   -- computed subtotal
    CONSTRAINT FK_item_order   FOREIGN KEY (order_id)   REFERENCES ck.orders(order_id),
    CONSTRAINT FK_item_product FOREIGN KEY (product_id) REFERENCES ck.product(product_id)
);

-- Payments
IF OBJECT_ID('ck.payment') IS NOT NULL DROP TABLE ck.payment;
CREATE TABLE ck.payment (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id   INT NOT NULL UNIQUE,  -- one payment per order (simple)
    amount     DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    method     NVARCHAR(20) NOT NULL,  -- Cash|Card|Mobile
    paid_at    DATETIME NOT NULL DEFAULT(GETDATE()),
    CONSTRAINT FK_payment_order FOREIGN KEY (order_id) REFERENCES ck.orders(order_id)
);

--  Indexes
CREATE INDEX IX_orders_order_date ON ck.orders(order_date);
CREATE INDEX IX_item_order ON ck.order_item(order_id);
CREATE INDEX IX_item_product ON ck.order_item(product_id);

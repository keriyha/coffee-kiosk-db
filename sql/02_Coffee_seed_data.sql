-- Call DB Coffee

USE CoffeeKioskDB;
GO

-- Customers
INSERT INTO ck.customer (name, email, sign_up_date)
VALUES
('Alice Johnson','alice@example.com',  DATEADD(DAY,-30, CAST(GETDATE() AS date))),
('Ben Carter','ben@example.com',       DATEADD(DAY,-10, CAST(GETDATE() AS date))),
('Chen Li','chen@example.com',         DATEADD(DAY,-3,  CAST(GETDATE() AS date))),
('Dina Owens','dina@example.com',      CAST(GETDATE() AS date));

-- Products
INSERT INTO ck.product (name, category, unit_cost, unit_price)
VALUES
('Espresso','Coffee', 0.60, 2.50),
('Latte','Coffee',    1.10, 4.00),
('Americano','Coffee',0.70, 3.00),
('Green Tea','Tea',   0.40, 2.50),
('Croissant','Pastry',0.80, 3.50);

-- A few Orders (+ Items + Payment)
-- Order 1 (Alice)
DECLARE @o1 INT;
INSERT INTO ck.orders (customer_id, order_date, status)
SELECT customer_id, CAST(GETDATE() AS date), 'Completed'
FROM ck.customer WHERE email='alice@example.com';
SET @o1 = SCOPE_IDENTITY();

INSERT INTO ck.order_item (order_id, product_id, quantity, unit_price)
SELECT @o1, p.product_id, 1, p.unit_price FROM ck.product p WHERE p.name='Latte';
INSERT INTO ck.order_item (order_id, product_id, quantity, unit_price)
SELECT @o1, p.product_id, 1, p.unit_price FROM ck.product p WHERE p.name='Croissant';

INSERT INTO ck.payment (order_id, amount, method)
SELECT @o1, (SELECT SUM(line_subtotal) FROM ck.order_item WHERE order_id=@o1), 'Card';

-- Order 2 (Ben)
DECLARE @o2 INT;
INSERT INTO ck.orders (customer_id, order_date, status)
SELECT customer_id, DATEADD(DAY,-1, CAST(GETDATE() AS date)), 'Completed'
FROM ck.customer WHERE email='ben@example.com';
SET @o2 = SCOPE_IDENTITY();

INSERT INTO ck.order_item (order_id, product_id, quantity, unit_price)
SELECT @o2, p.product_id, 2, p.unit_price FROM ck.product p WHERE p.name='Americano';

INSERT INTO ck.payment (order_id, amount, method)
SELECT @o2, (SELECT SUM(line_subtotal) FROM ck.order_item WHERE order_id=@o2), 'Cash';

-- Order 3 (Chen) - Pending (no payment yet)
DECLARE @o3 INT;
INSERT INTO ck.orders (customer_id, order_date, status)
SELECT customer_id, CAST(GETDATE() AS date), 'Pending'
FROM ck.customer WHERE email='chen@example.com';
SET @o3 = SCOPE_IDENTITY();

INSERT INTO ck.order_item (order_id, product_id, quantity, unit_price)
SELECT @o3, p.product_id, 1, p.unit_price FROM ck.product p WHERE p.name='Espresso';

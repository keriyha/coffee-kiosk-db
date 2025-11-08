
USE CoffeeKioskDB;
GO

-- Daily sales (paid orders only)
CREATE OR ALTER VIEW ck.vw_daily_sales AS
SELECT 
  o.order_date,
  SUM(oi.line_subtotal) AS gross_sales,
  COUNT(DISTINCT o.order_id) AS orders_count
FROM ck.orders o
JOIN ck.order_item oi ON oi.order_id = o.order_id
JOIN ck.payment pay   ON pay.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY o.order_date;

-- Top products by revenue (paid only)
CREATE OR ALTER VIEW ck.vw_top_products AS
SELECT 
  p.name AS product_name,
  p.category,
  SUM(oi.line_subtotal) AS revenue,
  SUM(oi.quantity) AS units
FROM ck.order_item oi
JOIN ck.orders o  ON o.order_id = oi.order_id
JOIN ck.payment py ON py.order_id = o.order_id
JOIN ck.product p ON p.product_id = oi.product_id
WHERE o.status = 'Completed'
GROUP BY p.name, p.category;


-- Simple margin view (relies on unit_price and unit_cost)
CREATE OR ALTER VIEW ck.vw_margin AS
SELECT 
  p.name AS product_name,
  SUM(oi.quantity * (oi.unit_price - p.unit_cost)) AS gross_margin
FROM ck.order_item oi
JOIN ck.orders o ON o.order_id = oi.order_id
JOIN ck.payment py ON py.order_id = o.order_id
JOIN ck.product p ON p.product_id = oi.product_id
WHERE o.status = 'Completed'
GROUP BY p.name;

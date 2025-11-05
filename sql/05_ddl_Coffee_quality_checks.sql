
USE CoffeeKioskDB;
GO

-- Orphan checks
SELECT 'orphan_items_orders' AS check_name, COUNT(*) AS cnt
FROM ck.order_item i
LEFT JOIN ck.orders o ON o.order_id = i.order_id
WHERE o.order_id IS NULL;

SELECT 'orphan_items_products' AS check_name, COUNT(*) AS cnt
FROM ck.order_item i
LEFT JOIN ck.product p ON p.product_id = i.product_id
WHERE p.product_id IS NULL;

-- Negative or zero money? (should be none)
SELECT 'bad_prices' AS issue, COUNT(*) AS cnt
FROM ck.order_item
WHERE unit_price <= 0;

-- Orders completed without payment (should be 0)
SELECT 'completed_without_payment' AS issue, COUNT(*) AS cnt
FROM ck.orders o
LEFT JOIN ck.payment py ON py.order_id = o.order_id
WHERE o.status='Completed' AND py.order_id IS NULL;

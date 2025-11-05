
-- 1) Daily sales
SELECT * FROM ck.vw_daily_sales ORDER BY order_date DESC;

-- 2) Top products
SELECT TOP 5 * FROM ck.vw_top_products;

-- 3) Margin by product
SELECT * FROM ck.vw_margin ORDER BY gross_margin DESC;

-- 4) Customer LTV (very simple: sum of paid orders)
SELECT c.name, c.email, SUM(oi.line_subtotal) AS lifetime_value
FROM ck.customer c
JOIN ck.orders o ON o.customer_id = c.customer_id
JOIN ck.payment py ON py.order_id = o.order_id
JOIN ck.order_item oi ON oi.order_id = o.order_id
GROUP BY c.name, c.email
ORDER BY lifetime_value DESC;

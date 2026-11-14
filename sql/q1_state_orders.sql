-- Q1. Order volume by customer state
-- Counts distinct order_id per customer_state. DISTINCT is used as a safeguard
-- so that an order can never be counted twice.
-- Each order has exactly one customer (many-to-one join), so the state totals
-- should add up to 99,441, the number of rows in the orders table.
-- All order statuses are included (canceled and unavailable orders are not excluded).
SELECT customer_state, COUNT(DISTINCT order_id) AS order_count FROM orders
JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customer_state
ORDER BY order_count DESC;
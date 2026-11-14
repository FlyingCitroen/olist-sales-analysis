-- Q2. Cancellation rate (share of orders by status)
-- Computed on the orders table only: one row per order, so no JOIN is needed.
-- Counting distinct order_id keeps the numerator and the denominator on the
-- same definition, so the percentages add up to 100%.
-- canceled and unavailable are reported as separate statuses because they mean
-- different things (canceled order vs. item not available).
-- Orders still in progress (shipped, invoiced, processing, created, approved)
-- are neither delivered nor canceled, so the delivered share is a lower bound
-- of the final fulfillment rate.
SELECT order_status,
       COUNT(DISTINCT order_id) AS order_count,
       ROUND(100.0 * COUNT(DISTINCT order_id) / (SELECT COUNT(DISTINCT order_id) FROM orders), 2) AS pct   -- 100.0 forces decimal division
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;
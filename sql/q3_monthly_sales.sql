-- Q3. Monthly sales
-- Sales = sum of item price (freight excluded), grouped by the month the order was placed.
-- Orders with status canceled or unavailable are excluded, because some of them
-- still have item rows (467 orders) and would otherwise inflate sales.
-- Orders still in progress are kept.
-- Only Jan 2017 to Aug 2018 is used: the months before and after have almost no orders.
-- orders and order_items are joined on order_id (one order, many items).
SELECT strftime('%Y-%m', order_purchase_timestamp) AS order_monthly,   -- order month, e.g. 2017-11
       ROUND(SUM(price), 2) AS sales                                   -- total item price in the month
FROM orders
JOIN order_items ON order_items.order_id = orders.order_id
WHERE strftime('%Y-%m', order_purchase_timestamp) >= '2017-01'         -- the alias cannot be used in WHERE, so strftime is repeated
  AND strftime('%Y-%m', order_purchase_timestamp) <= '2018-08'
  AND order_status NOT IN ('canceled', 'unavailable')                  -- both statuses excluded
GROUP BY order_monthly
ORDER BY order_monthly;
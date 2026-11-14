-- Q4. Top 10 product categories by sales
-- Sales = sum of item price (freight excluded), grouped by English category name.
-- Orders with status canceled or unavailable are excluded.
-- LEFT JOIN keeps item rows whose product has no category, or whose category is
-- missing from the translation table; they are labeled 'Unknown' instead of being dropped.
-- Note: the pandas version added English names for 2 untranslated categories
-- (pc_gamer, portateis_cozinha_e_preparadores_de_alimentos); here they fall into 'Unknown'.
-- This does not change the top 10.
SELECT COALESCE(category.product_category_name_english, 'Unknown') AS category_name,   -- NULL becomes 'Unknown'
       ROUND(SUM(order_items.price), 2) AS total_price
FROM order_items
JOIN orders ON orders.order_id = order_items.order_id
LEFT JOIN products ON products.product_id = order_items.product_id                    -- keep items even if the product is missing
LEFT JOIN category ON category.product_category_name = products.product_category_name  -- keep items without a translation
WHERE orders.order_status NOT IN ('canceled', 'unavailable')
GROUP BY category_name
ORDER BY total_price DESC
LIMIT 10;
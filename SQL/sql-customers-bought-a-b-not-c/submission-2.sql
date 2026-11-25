-- WITH cte AS (
--     SELECT
--         a.customer_id,
--         a.customer_name,
--         '|' || STRING_AGG(b.product_name, '|' ORDER BY b.product_name) || '|' AS products
--     FROM customers a
--     INNER JOIN orders b
--         ON a.customer_id = b.customer_id
--     GROUP BY 1, 2
-- )
-- SELECT
--     customer_id,
--     customer_name
-- FROM cte
-- WHERE products LIKE '%|A|%'
--   AND products LIKE '%|B|%'
--   AND products NOT LIKE '%|C|%'
-- ORDER BY customer_name;

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING
    COUNT(CASE WHEN product_name = 'A' THEN 1 END) > 0
    AND COUNT(CASE WHEN product_name = 'B' THEN 1 END) > 0
    AND COUNT(CASE WHEN product_name = 'C' THEN 1 END) = 0
ORDER BY c.customer_name;

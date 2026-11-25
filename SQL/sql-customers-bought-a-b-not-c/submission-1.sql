WITH cte AS (
    SELECT
        a.customer_id,
        a.customer_name,
        '|' || STRING_AGG(b.product_name, '|' ORDER BY b.product_name) || '|' AS products
    FROM customers a
    INNER JOIN orders b
        ON a.customer_id = b.customer_id
    GROUP BY 1, 2
)
SELECT
    customer_id,
    customer_name
FROM cte
WHERE products LIKE '%|A|%'
  AND products LIKE '%|B|%'
  AND products NOT LIKE '%|C|%'
ORDER BY customer_name;
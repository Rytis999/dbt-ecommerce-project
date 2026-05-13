SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    COUNT(o.order_id) AS number_of_orders
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_city,
    c.customer_state
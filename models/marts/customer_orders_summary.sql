WITH orders_agg AS (

    SELECT
        customer_id,
        COUNT(order_id) AS number_of_orders,
        MIN(order_ts) AS first_order_date,
        MAX(order_ts) AS last_order_date
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id

)

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.number_of_orders,
    o.first_order_date,
    o.last_order_date
FROM {{ ref('stg_customers') }} c
LEFT JOIN orders_agg o
    ON c.customer_id = o.customer_id
WITH payments_agg AS (

    SELECT
        order_id,
        SUM(payment_value) AS order_revenue
    FROM {{ ref('stg_order_payments') }}
    GROUP BY order_id

),

orders_joined AS (

    SELECT
        o.order_id,
        o.customer_id,
        p.order_revenue
    FROM {{ ref('stg_orders') }} o
    LEFT JOIN payments_agg p
        ON o.order_id = p.order_id

),

customer_agg AS (

    SELECT
        customer_id,
        COUNT(order_id) AS number_of_orders,
        SUM(order_revenue) AS total_spent
    FROM orders_joined
    GROUP BY customer_id

)

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    COALESCE(a.number_of_orders, 0) AS number_of_orders,
    COALESCE(a.total_spent, 0) AS total_spent
FROM {{ ref('stg_customers') }} c
LEFT JOIN customer_agg a
    ON c.customer_id = a.customer_id
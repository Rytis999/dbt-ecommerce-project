WITH payments_agg AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_revenue
    FROM {{ ref('stg_order_payments') }}
    GROUP BY order_id
)


SELECT
    o.order_id,
    o.customer_id,
    o.order_ts,
    p.order_revenue
FROM {{ ref('stg_orders') }} o
LEFT JOIN payments_agg p
    ON o.order_id = p.order_id
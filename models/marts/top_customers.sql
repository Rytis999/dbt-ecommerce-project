SELECT
    customer_id,
    customer_city,
    customer_state,
    total_spent,
    number_of_orders,
    RANK() OVER (ORDER BY total_spent DESC) AS rank
FROM {{ ref('customer_revenue') }}








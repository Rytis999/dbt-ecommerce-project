SELECT 
      order_id,
      customer_id,
      TIMESTAMP(order_purchase_timestamp) AS order_ts,
      order_status
FROM {{ref("olist_orders_dataset")}} 



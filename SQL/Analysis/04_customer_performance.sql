-- Customer Performance Analysis
-- Purpose: Analyze customer purchasing behavior, revenue, order frequency,
-- and customer lifetime.

SELECT
    customer_unique_id,
    orders,
    revenue,
    avg_order_value,
    first_order_date,
    last_order_date,
    customer_lifetime_days
FROM vw_customer_performance
ORDER BY revenue DESC;
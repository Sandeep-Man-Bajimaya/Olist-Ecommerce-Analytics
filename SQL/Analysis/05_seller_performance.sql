-- Seller Performance Analysis
-- Purpose: Compare sellers by order volume, units sold, revenue,
-- and average selling price.

SELECT
    seller_id,
    orders,
    units_sold,
    revenue,
    avg_selling_price,
    ROUND(revenue / NULLIF(orders, 0), 2) AS revenue_per_order
FROM vw_seller_performance
ORDER BY revenue DESC;
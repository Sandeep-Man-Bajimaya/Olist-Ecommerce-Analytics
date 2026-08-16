-- Category Performance Analysis
-- Purpose: Compare product categories by sales volume and revenue contribution.

SELECT
    category,
    products,
    orders,
    units_sold,
    revenue,
    revenue_share_pct,
    avg_selling_price,
    ROUND(revenue / NULLIF(orders, 0), 2) AS revenue_per_order
FROM vw_category_performance
ORDER BY revenue DESC;
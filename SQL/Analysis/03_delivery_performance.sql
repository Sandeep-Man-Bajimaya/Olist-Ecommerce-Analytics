-- Delivery Performance Analysis
-- Purpose: Measure delivery outcomes and customer satisfaction.

SELECT
    dp.delivery_status,
    COUNT(DISTINCT dp.order_id) AS orders,
    ROUND(
        COUNT(DISTINCT dp.order_id) /
        (SELECT COUNT(DISTINCT order_id)
         FROM vw_delivery_performance) * 100,
        2
    ) AS order_share_pct,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM vw_delivery_performance dp
LEFT JOIN olist_order_reviews r
    ON dp.order_id = r.order_id
GROUP BY
    dp.delivery_status
ORDER BY
    FIELD(dp.delivery_status, 'Early', 'On Time', 'Late');
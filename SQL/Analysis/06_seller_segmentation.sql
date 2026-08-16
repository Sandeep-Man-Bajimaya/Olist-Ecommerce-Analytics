-- Seller Segmentation Analysis
-- Purpose: Analyze the distribution and revenue contribution of seller performance segments.

SELECT
    seller_segment,
    COUNT(*) AS sellers,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(
        SUM(revenue) /
        (SELECT SUM(revenue) FROM vw_seller_segments) * 100,
        2
    ) AS revenue_share_pct,
    ROUND(AVG(revenue), 2) AS avg_seller_revenue
FROM vw_seller_segments
GROUP BY seller_segment
ORDER BY
    CASE seller_segment
        WHEN 'Top Performer' THEN 1
        WHEN 'Strong Performer' THEN 2
        WHEN 'Developing Seller' THEN 3
        WHEN 'Low Performer' THEN 4
        ELSE 5
    END;
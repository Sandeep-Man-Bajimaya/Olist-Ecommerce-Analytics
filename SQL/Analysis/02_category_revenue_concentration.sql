-- Category Revenue Concentration Analysis
-- Purpose: Measure how much revenue is concentrated among the highest-performing categories.

WITH ranked_categories AS (
    SELECT
        category,
        revenue,
        ROW_NUMBER() OVER (ORDER BY revenue DESC) AS revenue_rank
    FROM vw_category_performance
)
SELECT
    CASE
        WHEN revenue_rank <= 3 THEN 'Top 3 Categories'
        WHEN revenue_rank <= 5 THEN 'Top 5 Categories'
        WHEN revenue_rank <= 10 THEN 'Top 10 Categories'
        ELSE 'Remaining'
    END AS category_group,
    COUNT(*) AS categories,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(
        SUM(revenue) /
        (SELECT SUM(revenue) FROM vw_category_performance) * 100,
        2
    ) AS revenue_share_pct
FROM ranked_categories
GROUP BY
    CASE
        WHEN revenue_rank <= 3 THEN 'Top 3 Categories'
        WHEN revenue_rank <= 5 THEN 'Top 5 Categories'
        WHEN revenue_rank <= 10 THEN 'Top 10 Categories'
        ELSE 'Remaining'
    END
ORDER BY
    MIN(revenue_rank);
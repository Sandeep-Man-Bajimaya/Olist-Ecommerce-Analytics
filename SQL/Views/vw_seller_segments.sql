CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_seller_segments` AS

SELECT
    `ranked_sellers`.`seller_id` AS `seller_id`,
    `ranked_sellers`.`orders` AS `orders`,
    `ranked_sellers`.`units_sold` AS `units_sold`,
    `ranked_sellers`.`revenue` AS `revenue`,
    `ranked_sellers`.`avg_selling_price` AS `avg_selling_price`,
    CASE
        WHEN `ranked_sellers`.`seller_rank` <= 594
            THEN 'Top Performer'
        WHEN `ranked_sellers`.`seller_rank` <= 1485
            THEN 'Strong Performer'
        WHEN `ranked_sellers`.`seller_rank` <= 2376
            THEN 'Developing Seller'
        ELSE 'Low Performer'
    END AS `seller_segment`

FROM (
    SELECT
        `vw_seller_performance`.`seller_id` AS `seller_id`,
        `vw_seller_performance`.`orders` AS `orders`,
        `vw_seller_performance`.`units_sold` AS `units_sold`,
        `vw_seller_performance`.`revenue` AS `revenue`,
        `vw_seller_performance`.`avg_selling_price` AS `avg_selling_price`,
        ROW_NUMBER() OVER (
            ORDER BY
                `vw_seller_performance`.`revenue` DESC,
                `vw_seller_performance`.`seller_id`
        ) AS `seller_rank`

    FROM
        `vw_seller_performance`
) `ranked_sellers`;
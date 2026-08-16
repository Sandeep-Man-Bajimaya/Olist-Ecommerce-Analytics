CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_category_performance` AS

SELECT
    `category_performance`.`category` AS `category`,
    `category_performance`.`products` AS `products`,
    `category_performance`.`orders` AS `orders`,
    `category_performance`.`units_sold` AS `units_sold`,
    `category_performance`.`revenue` AS `revenue`,
    ROUND(
        (
            `category_performance`.`revenue`
            / NULLIF(`category_performance`.`total_revenue`, 0)
        ) * 100,
        2
    ) AS `revenue_share_pct`,
    `category_performance`.`avg_selling_price` AS `avg_selling_price`

FROM (
    SELECT
        COALESCE(
            NULLIF(
                REPLACE(
                    REPLACE(
                        TRIM(`t`.`product_category_name_english`),
                        CHAR(13),
                        ''
                    ),
                    CHAR(10),
                    ''
                ),
                ''
            ),
            CASE
                WHEN TRIM(`p`.`product_category_name`) = ''
                    THEN 'Unknown'
                ELSE 'Untranslated'
            END
        ) AS `category`,

        COUNT(DISTINCT `oi`.`product_id`) AS `products`,
        COUNT(DISTINCT `oi`.`order_id`) AS `orders`,
        COUNT(0) AS `units_sold`,
        ROUND(SUM(`oi`.`price`), 2) AS `revenue`,
        ROUND(AVG(`oi`.`price`), 2) AS `avg_selling_price`,

        (
            SELECT
                SUM(`oi2`.`price`)
            FROM
                `olist_order_items` `oi2`
                JOIN `vw_completed_orders` `co2`
                    ON `oi2`.`order_id` = `co2`.`order_id`
        ) AS `total_revenue`

    FROM
        `olist_order_items` `oi`
        JOIN `vw_completed_orders` `co`
            ON `oi`.`order_id` = `co`.`order_id`
        JOIN `olist_products` `p`
            ON `oi`.`product_id` = `p`.`product_id`
        LEFT JOIN `product_category_translation` `t`
            ON `p`.`product_category_name` = `t`.`product_category_name`

    GROUP BY
        COALESCE(
            NULLIF(
                REPLACE(
                    REPLACE(
                        TRIM(`t`.`product_category_name_english`),
                        CHAR(13),
                        ''
                    ),
                    CHAR(10),
                    ''
                ),
                ''
            ),
            CASE
                WHEN TRIM(`p`.`product_category_name`) = ''
                    THEN 'Unknown'
                ELSE 'Untranslated'
            END
        )
) `category_performance`;
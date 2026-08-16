CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_seller_performance` AS

SELECT
    `oi`.`seller_id` AS `seller_id`,
    COUNT(DISTINCT `oi`.`order_id`) AS `orders`,
    COUNT(0) AS `units_sold`,
    ROUND(SUM(`oi`.`price`), 2) AS `revenue`,
    ROUND(AVG(`oi`.`price`), 2) AS `avg_selling_price`

FROM
    `olist_order_items` `oi`
    JOIN `vw_completed_orders` `co`
        ON `oi`.`order_id` = `co`.`order_id`

GROUP BY
    `oi`.`seller_id`;
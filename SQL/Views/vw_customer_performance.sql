CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_customer_performance` AS

SELECT
    `c`.`customer_unique_id` AS `customer_unique_id`,
    COUNT(DISTINCT `o`.`order_id`) AS `orders`,
    ROUND(SUM(`oi`.`price`), 2) AS `revenue`,
    ROUND(
        SUM(`oi`.`price`) / COUNT(DISTINCT `o`.`order_id`),
        2
    ) AS `avg_order_value`,
    MIN(`o`.`order_purchase_timestamp`) AS `first_order_date`,
    MAX(`o`.`order_purchase_timestamp`) AS `last_order_date`,
    (
        TO_DAYS(MAX(`o`.`order_purchase_timestamp`))
        - TO_DAYS(MIN(`o`.`order_purchase_timestamp`))
    ) AS `customer_lifetime_days`

FROM
    `olist_orders` `o`
    JOIN `olist_customers` `c`
        ON `o`.`customer_id` = `c`.`customer_id`
    JOIN `vw_completed_orders` `co`
        ON `o`.`order_id` = `co`.`order_id`
    JOIN `olist_order_items` `oi`
        ON `o`.`order_id` = `oi`.`order_id`

GROUP BY
    `c`.`customer_unique_id`;
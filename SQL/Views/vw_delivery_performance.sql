CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_delivery_performance` AS

SELECT
    `olist_orders`.`order_id` AS `order_id`,
    CASE
        WHEN (
            TO_DAYS(`olist_orders`.`order_delivered_customer_date`)
            - TO_DAYS(`olist_orders`.`order_estimated_delivery_date`)
        ) > 0
            THEN 'Late'

        WHEN (
            TO_DAYS(`olist_orders`.`order_delivered_customer_date`)
            - TO_DAYS(`olist_orders`.`order_estimated_delivery_date`)
        ) = 0
            THEN 'On Time'

        ELSE 'Early'
    END AS `delivery_status`

FROM
    `olist_orders`

WHERE
    `olist_orders`.`order_delivered_customer_date` IS NOT NULL
    AND `olist_orders`.`order_estimated_delivery_date` IS NOT NULL;
CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_completed_sales` AS

SELECT
    `o`.`order_id` AS `order_id`,
    `o`.`customer_id` AS `customer_id`,
    `c`.`customer_unique_id` AS `customer_unique_id`,
    `o`.`order_status` AS `order_status`,
    `o`.`order_purchase_timestamp` AS `order_purchase_timestamp`,
    `o`.`order_approved_at` AS `order_approved_at`,
    `o`.`order_delivered_carrier_date` AS `order_delivered_carrier_date`,
    `o`.`order_delivered_customer_date` AS `order_delivered_customer_date`,
    `o`.`order_estimated_delivery_date` AS `order_estimated_delivery_date`,
    `oi`.`order_item_id` AS `order_item_id`,
    `oi`.`product_id` AS `product_id`,
    `oi`.`seller_id` AS `seller_id`,
    `oi`.`price` AS `price`,
    `oi`.`freight_value` AS `freight_value`,
    `p`.`product_category_name` AS `product_category_name`,
    `pct`.`product_category_name_english` AS `product_category_name_english`

FROM
    `olist_orders` `o`
    JOIN `olist_customers` `c`
        ON `o`.`customer_id` = `c`.`customer_id`
    JOIN `olist_order_items` `oi`
        ON `o`.`order_id` = `oi`.`order_id`
    LEFT JOIN `olist_products` `p`
        ON `oi`.`product_id` = `p`.`product_id`
    LEFT JOIN `product_category_translation` `pct`
        ON `p`.`product_category_name` = `pct`.`product_category_name`

WHERE
    `o`.`order_status` = 'delivered';
CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_completed_orders` AS
SELECT DISTINCT
    `vw_completed_sales`.`order_id` AS `order_id`
FROM `vw_completed_sales`;
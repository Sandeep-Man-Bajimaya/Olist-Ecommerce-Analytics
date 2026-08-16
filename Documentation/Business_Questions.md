# Olist E-Commerce Analytics 



## Business Questions



### 1\. Executive Overview



#### Q1. How much revenue did the business generate?

**KPI:** Total Revenue

**Answer:** 13,221,498.11

This measures the total revenue generated from the completed-sales population used in the analysis.



#### Q2. How many completed orders were analyzed?

**KPI:** Completed Orders

**Answer:** 96,476

Completed orders are counted as distinct order IDs from vw\_completed\_orders.



#### Q3. How many customers purchased?

**KPI:** Customers

**Answer:** 93,358 unique customers.



#### Q4. What is the overall average order value?

**KPI:** Average Order Value

**Answer:** 137.04

Calculated as:
Total Revenue ÷ Distinct Completed Orders


#### Q5. How many sellers contributed to the completed-sales dataset?

**KPI:** Sellers

**Answer:** 2,970 sellers.



### 2\. Category Analysis



#### Q6. Which product categories generate the most revenue?

**Visual:** Category Revenue

The category analysis ranks categories by revenue to identify the strongest revenue contributors.



#### Q7. How concentrated is revenue among the highest-performing categories?

**Analysis:** Category Revenue Concentration

Categories are ranked by revenue and grouped into:

* Top 3 Categories
* Top 5 Categories
* Top 10 Categories
* Remaining

This shows whether revenue is broadly distributed or concentrated among a small number of categories.



#### Q8. How many products and units are associated with each category?

**Analysis:** Category Performance

The analysis compares:

* Products
* Orders
* Units Sold
* Revenue
* Average Selling Price

This provides both sales-volume and revenue perspectives.



### 3\. Customer Analysis



#### Q9. Which customers generate the most revenue?

**Visual:** Top Customers by Revenue

Customers are ranked by total revenue to identify high-value customers.



#### Q10. How frequently do customers purchase?

**Metric:** Average Orders per Customer

**Validated value:** Approximately 1.03 orders per customer.

This indicates that the analyzed customer population has relatively low repeat-order frequency.



#### Q11. How much revenue does each customer generate?

**Analysis:** Customer Performance

Customer revenue is calculated from completed orders and associated order items.



#### Q12. How long do customers remain active?

**Metric:** Customer Lifetime Days

Customer lifetime is measured as the number of days between the customer's first and last recorded completed orders.



#### Q13. What is the relationship between customer revenue and order frequency?

**Visual:** Customer Revenue vs. Order Frequency

This helps identify customers who generate high revenue through repeated purchases versus customers with fewer but higher-value orders.



### 4\. Seller Analysis



#### Q14. Which sellers generate the most revenue?

**Visual:** Top Sellers by Revenue

Sellers are ranked by completed-order revenue.



#### Q15. Which sellers have the highest order volume?

**Visual:** Top Sellers by Orders

Sellers are ranked according to their order count.



#### Q16. How concentrated is revenue across sellers?

**Analysis:** Seller Segmentation

Sellers are classified according to revenue rank.

|Segment|Sellers|Revenue Share|
|-|-:|-:|
|Top Performer|594|82.29%|
|Strong Performer|891|14.40%|
|Developing Seller|891|2.93%|
|Low Performer|594|0.38%|

### 

#### Q17. How does seller revenue relate to units sold?

**Visual:** Seller Revenue vs. Units Sold

The scatter analysis compares seller revenue with units sold to identify high-volume and high-revenue sellers.



### 5\. Delivery Analysis



#### Q18. How many deliveries were Early, On Time, or Late?

**Analysis:** Delivery Performance

Validated results:

|Delivery Status|Orders|Share|
|-|-:|-:|
|Early|88,649|91.89%|
|On Time|1,292|1.34%|
|Late|6,535|6.77%|

### 

#### Q19. What proportion of deliveries were late?

**Answer:** 6.77%.

Late delivery is determined by comparing the actual customer delivery date with the estimated delivery date.



#### Q20. What proportion of deliveries arrived early?

**Answer:** 91.89%.



### 6\. Geographic Analysis



#### Q21. Which states generate the most revenue?

**Visual:** Revenue by State

Revenue is aggregated by customer location to identify the strongest geographic markets.



#### Q22. Where is business activity concentrated geographically?

**Visual:** Revenue by State

The geographic visualization provides a high-level view of where completed sales are concentrated.



### 7\. Data Validation Questions



#### Q23. Does the revenue reported by different analytical views reconcile?

**Answer:** Yes.

The following views all produce total revenue of:

**13,221,498.11**

* vw\_category\_performance
* vw\_customer\_performance
* vw\_seller\_performance



#### Q24. Why is seller-level order count different from completed order count?

An individual completed order can contain items from multiple sellers.

Therefore:

* Distinct completed orders = **96,476**
* Sum of seller-level order counts = **97,819**

These metrics measure different things and should not be treated as interchangeable.



#### Q25. Why can average customer AOV differ from overall AOV?

The overall AOV is:

Total Revenue ÷ Total Completed Orders
The customer-level average AOV is the average of each customer's individual AOV.

These calculations use different aggregation levels, so the results can differ.



### 8\. Business Decision Questions

The dashboard is designed to help answer these broader business questions:



1. Which categories deserve the most commercial attention?
2. Which sellers are responsible for the majority of revenue?
3. Where are opportunities to improve seller performance?
4. How significant are late deliveries?
5. How strong is customer repeat purchasing?
6. Which customers generate the highest revenue?
7. Which geographic markets contribute the most revenue?
8. Is revenue concentrated among a small number of categories or sellers?
9. Which operational metrics should management monitor regularly?
10. Where should additional analysis be performed to improve revenue and customer retention?



### 9\. Analytical Scope

The business questions are answered using the completed-sales population and supporting Olist datasets used in the project.

The results describe the analyzed dataset and should not automatically be interpreted as representing all e-commerce activity outside the dataset's scope.


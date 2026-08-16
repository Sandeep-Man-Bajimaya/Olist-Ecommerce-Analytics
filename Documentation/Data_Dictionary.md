# Olist E-Commerce Analytics

## Data Dictionary



### 1\. Purpose

This document defines the main fields and analytical metrics used in the Olist E-Commerce Analytics project.

The dictionary focuses on fields used by the SQL analytical views, analysis queries, and Power BI dashboard.



### 2\. Core Order Fields

|Field|Description|Analytical Use|
|-|-|-|
|order\_id|Unique identifier for an order|Order counting, joins, delivery analysis|
|customer\_id|Identifier linking an order to a customer record|Customer analysis|
|customer\_unique\_id|Unique customer identifier across customer records|Customer-level aggregation|
|order\_status|Current status of an order|Filtering completed/delivered orders|
|order\_purchase\_timestamp|Date and time when the order was placed|Time analysis|
|order\_approved\_at|Date and time when payment/order approval occurred|Order processing analysis|
|order\_delivered\_carrier\_date|Date when the order was handed to the carrier|Delivery analysis|
|order\_delivered\_customer\_date|Date when the customer received the order|Delivery performance|
|order\_estimated\_delivery\_date|Estimated delivery date|Early/on-time/late classification|



### 3\. Order Item Fields

|Field|Description|Analytical Use|
|-|-|-|
|order\_item\_id|Sequential item identifier within an order|Item-level analysis|
|product\_id|Identifier for the purchased product|Product/category analysis|
|seller\_id|Identifier for the seller fulfilling the item|Seller analysis|
|price|Price of an individual order item|Revenue and pricing analysis|
|freight\_value|Freight/shipping value associated with an item|Shipping analysis|



### 4\. Customer Fields

|Field|Description|Analytical Use|
|-|-|-|
|customer\_id|Customer record identifier|Linking customers to orders|
|customer\_unique\_id|Unique customer identifier|Customer-level aggregation|
|customer\_city|Customer city|Geographic analysis|
|customer\_state|Customer state|Geographic revenue analysis|



### 5\. Product Fields

|Field|Description|Analytical Use|
|-|-|-|
|product\_id|Unique product identifier|Product-level joins|
|product\_category\_name|Original product category name|Category analysis|
|product\_category\_name\_english|English translation of the product category|Standardized category analysis|



### 6\. Review Fields

|Field|Description|Analytical Use|
|-|-|-|
|review\_id|Review identifier|Review-level analysis|
|order\_id|Order associated with the review|Joining reviews to orders|
|review\_score|Customer review score|Customer satisfaction analysis|



### 7\. Analytical View Fields



##### vw\_completed\_sales

|Field|Description|
|-|-|
|order\_id|Completed order identifier|
|customer\_id|Customer record identifier|
|customer\_unique\_id|Unique customer identifier|
|order\_status|Order status|
|order\_purchase\_timestamp|Purchase timestamp|
|order\_approved\_at|Approval timestamp|
|order\_delivered\_carrier\_date|Carrier delivery date|
|order\_delivered\_customer\_date|Customer delivery date|
|order\_estimated\_delivery\_date|Estimated delivery date|
|order\_item\_id|Order item identifier|
|product\_id|Product identifier|
|seller\_id|Seller identifier|
|price|Item price|
|freight\_value|Freight value|
|product\_category\_name|Original category|
|product\_category\_name\_english|English category|

### 

##### vw\_completed\_orders

|Field|Description|
|-|-|
|order\_id|Distinct completed order identifier|

### 

##### vw\_category\_performance

|Field|Description|
|-|-|
|category|Standardized product category|
|products|Number of distinct products|
|orders|Number of distinct orders|
|units\_sold|Number of order items sold|
|revenue|Total item revenue|
|revenue\_share\_pct|Category percentage of total revenue|
|avg\_selling\_price|Average item selling price|

### 

##### vw\_customer\_performance

|Field|Description|
|-|-|
|customer\_unique\_id|Unique customer|
|orders|Number of completed orders|
|revenue|Customer revenue|
|avg\_order\_value|Customer revenue divided by customer order count|
|first\_order\_date|Customer's earliest completed order|
|last\_order\_date|Customer's latest completed order|
|customer\_lifetime\_days|Days between first and last completed order|

### 

##### vw\_delivery\_performance

|Field|Description|
|-|-|
|order\_id|Order identifier|
|delivery\_status|Early, On Time, or Late|

### 

##### vw\_seller\_performance

|Field|Description|
|-|-|
|seller\_id|Seller identifier|
|orders|Number of seller-order relationships|
|units\_sold|Number of items sold|
|revenue|Seller revenue|
|avg\_selling\_price|Average item selling price|

### 

##### vw\_seller\_segments

|Field|Description|
|-|-|
|seller\_id|Seller identifier|
|orders|Seller order count|
|units\_sold|Seller units sold|
|revenue|Seller revenue|
|avg\_selling\_price|Average selling price|
|seller\_segment|Revenue-based seller performance group|



### 8\. Derived Metrics



##### Total Revenue

Total revenue from the completed-sales population.
SUM(price)
Validated value:

**13,221,498.11**



##### Completed Orders

Distinct number of completed order IDs.

Validated value:

**96,476**



##### Customers

Distinct unique customers represented in vw\_customer\_performance.

Validated value:

**93,358**



##### Average Order Value

Overall business AOV:

Total Revenue ÷ Distinct Completed Orders
Validated value:

**137.04**



##### Units Sold

Total number of order-item records included in the completed-sales analysis.

Validated value:

**110,197**



##### Seller Count

Number of sellers represented in vw\_seller\_performance.

Validated value:

**2,970**



##### Revenue Share

Percentage of total revenue contributed by a category or seller segment.
Segment Revenue ÷ Total Revenue × 100



## 9\. Delivery Classification

Delivery status is calculated using the difference between the actual customer delivery date and estimated delivery date.



##### Early

Actual Delivery Date < Estimated Delivery Date


##### On Time

Actual Delivery Date = Estimated Delivery Date


##### Late

Actual Delivery Date > Estimated Delivery Date


Validated distribution:

|Status|Orders|Share|
|-|-:|-:|
|Early|88,649|91.89%|
|On Time|1,292|1.34%|
|Late|6,535|6.77%|



### 10\. Seller Segmentation

Sellers are ranked by revenue in descending order.



The project divides the ranked sellers into four segments:

|Segment|Rank Range|Sellers|
|-|-:|-:|
|Top Performer|1–594|594|
|Strong Performer|595–1,485|891|
|Developing Seller|1,486–2,376|891|
|Low Performer|2,377–2,970|594|



The segmentation is implemented using `ROW\_NUMBER()` ordered by seller revenue descending, with seller\_id used as the secondary ordering field.



### 11\. Important Metric Distinctions



#### Completed Orders vs. Seller Orders

These are different measures.

`vw\_completed\_orders` counts distinct completed orders:

**96,476**

`vw\_seller\_performance` counts seller-order relationships. Summing those values produces:

**97,819**

An order can contain products from multiple sellers, so these values should not be treated as interchangeable.



#### Overall AOV vs. Average Customer AOV

Overall AOV:
Total Revenue ÷ Total Completed Orders

**137.04**

Average customer-level AOV:

**137.51**



The difference occurs because the second metric first calculates AOV for each customer and then averages those customer-level values.



### 12\. Data Quality Handling

The category performance view handles missing or untranslated category names.

If an English category translation is unavailable:

* Blank original categories are classified as "Unknown".
* Non-blank categories without an English translation are classified as "Untranslated".

This prevents missing category labels from being silently excluded from the category analysis.



### 13\. Scope

The metrics in this dictionary describe the analytical population and definitions used by this project.

Metrics should be interpreted according to their specific SQL view and aggregation level rather than assuming that similarly named measures are interchangeable across views.


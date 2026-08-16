# Olist E-Commerce Analytics



## Project Overview

Olist E-Commerce Analytics is an end-to-end data analytics project built using the Olist Brazilian E-Commerce dataset.



The project analyzes completed e-commerce transactions from multiple business perspectives, including sales, customers, product categories, delivery performance, and sellers.



The workflow combines SQL-based data preparation and analysis with an interactive Power BI dashboard.



### Business Problem

E-commerce businesses need to understand:

* How much revenue is being generated?
* Which product categories contribute the most revenue?
* Which sellers perform best?
* How frequently do customers purchase?
* How long do customers remain active?
* How effectively are orders delivered?
* Where is revenue concentrated across sellers and categories?

This project converts transactional data into business-focused metrics and visual insights.



### Objectives

* Prepare completed-order data for analysis.
* Build reusable SQL analytical views.
* Analyze customer purchasing behavior.
* Evaluate seller performance.
* Measure category-level sales performance.
* Analyze delivery outcomes.
* Identify revenue concentration.
* Build an interactive Power BI dashboard for business analysis.



### Dataset

**Dataset:** Olist Brazilian E-Commerce Dataset



The analysis uses information related to:

* Orders
* Customers
* Order items
* Products
* Sellers
* Product categories
* Delivery dates
* Order reviews



Only delivered orders are used as the primary completed-sales population where applicable.



### Tools \& Technologies

* **MySQL** => data preparation and analytical SQL
* **SQL** => views, aggregations, segmentation, and business analysis
* **Power BI** => interactive dashboard and visualization
* **Git/GitHub** => project version control and portfolio presentation



### SQL Architecture

The SQL layer contains seven reusable analytical views:



Base Olist Tables
│
▼
vw\_completed\_sales
│
▼
vw\_completed\_orders
│
├── vw\_category\_performance
├── vw\_customer\_performance
└── vw\_seller\_performance
│
▼
vw\_seller\_segments

olist\_orders
│
▼
vw\_delivery\_performance



##### Analytical Views

|View|Purpose|
|-|-|
|`vw\\\_completed\\\_sales`|Creates the completed-sales dataset from delivered orders|
|`vw\\\_completed\\\_orders`|Provides distinct completed order IDs|
|`vw\\\_category\\\_performance`|Measures category-level products, orders, units, and revenue|
|`vw\\\_customer\\\_performance`|Measures customer orders, revenue, AOV, and lifetime|
|`vw\\\_delivery\\\_performance`|Classifies delivery performance|
|`vw\\\_seller\\\_performance`|Measures seller orders, units, revenue, and selling price|
|`vw\\\_seller\\\_segments`|Segments sellers based on revenue ranking|



The repository also contains six standalone SQL analysis queries covering category performance, revenue concentration, delivery performance, customer performance, seller performance, and seller segmentation.



### Power BI Dashboard

The Power BI report contains three analytical pages.



##### 1\. Executive Overview

Provides a high-level view of the business through:

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value
* Delivery Performance
* Top Revenue Categories
* Top Sellers by Revenue
* Revenue by State



##### 2\. Customer \& Sales Analysis

Analyzes:

* Top Customers by Revenue
* Customer Activity Over Time
* Customer Distribution by Lifetime
* Revenue by Order Frequency
* Customer Revenue vs. Order Frequency



##### 3\. Seller Performance Analysis

Analyzes:

* Top Sellers by Revenue
* Top Sellers by Orders
* Revenue by Seller Segment
* Seller Revenue vs. Units Sold



### Key KPIs



|KPI|Value|
|-|-:|
|Total Revenue|13,221,498.11|
|Completed Orders|96,476|
|Customers|93,358|
|Average Order Value|137.04|
|Sellers|2,970|
|Units Sold|110,197|
|Average Selling Price|177.65|



Note: Seller-level order totals are not the same as distinct completed orders because an order can involve multiple sellers.



### Key Business Insights



##### Delivery Performance

* **91.89%** of completed deliveries were classified as Early.
* **1.34%** were On Time.
* **6.77%** were Late.



The delivery analysis shows that late deliveries represent a smaller portion of completed deliveries but remain an important operational metric to monitor.



##### Seller Concentration

The seller segmentation analysis shows substantial revenue concentration:

* **594 Top Performer sellers** generated **82.29% of revenue**.
* **891 Strong Performer sellers** generated **14.40%**.
* **891 Developing Seller sellers** generated **2.93%**.
* **594 Low Performer sellers** generated **0.38%**.

This indicates that a relatively small group of sellers contributes the majority of revenue.



##### Category Performance

Category-level analysis measures revenue, orders, units sold, product coverage, revenue share, and average selling price.



The analysis also evaluates revenue concentration across the highest-performing categories.



### Project Structure



Olist-Ecommerce-Analytics/
│
├── PowerBI/
│   └── Data/
│       └── Raw/
│
├── SQL/
│   ├── Views/
│   │   ├── vw\_completed\_sales.sql
│   │   ├── vw\_completed\_orders.sql
│   │   ├── vw\_category\_performance.sql
│   │   ├── vw\_customer\_performance.sql
│   │   ├── vw\_delivery\_performance.sql
│   │   ├── vw\_seller\_performance.sql
│   │   └── vw\_seller\_segments.sql
│   │
│   └── Analysis/
│       ├── 01\_category\_performance.sql
│       ├── 02\_category\_revenue\_concentration.sql
│       ├── 03\_delivery\_performance.sql
│       ├── 04\_customer\_performance.sql
│       ├── 05\_seller\_performance.sql
│       └── 06\_seller\_segmentation.sql
│
├── Documentation/
│
└── README.md



Analytical Workflow
Raw Olist Dataset
↓
MySQL Data Preparation
↓
Reusable SQL Views
↓
Business Analysis Queries
↓
Power BI Data Model
↓
Interactive Dashboard
↓
Business Insights



### Validation

The main analytical views were validated against the Power BI dashboard.



Key reconciled values include:

* Revenue: **13,221,498.11**
* Customers: **93,358**
* Completed orders: **96,476**
* Sellers: **2,970**
* Units sold: **110,197**



The delivery distribution and seller segmentation results were also independently validated through MySQL queries.

## 

## Author



**Sandeep**



Data Analyst Portfolio Project


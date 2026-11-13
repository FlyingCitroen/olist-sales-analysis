# Olist E-Commerce Sales Analysis

Exploratory analysis of the Olist Brazilian E-Commerce dataset with Python and pandas: merging 7 relational tables into one order-item level table and answering four business questions.

## Background

The dataset contains about 99,000 orders placed on a Brazilian online marketplace between 2016 and 2018, stored in 9 relational tables. I merged 7 of them into one order-item level table (113,425 rows), checking row counts at every join, and answered four questions:

1. Order volume by customer state
2. Cancellation rate
3. Monthly sales
4. Top 10 product categories by sales

Tools: Python, pandas. A SQL version will be added later.

## Key findings

1. **Orders by state:** Demand is concentrated in the southeast. SP has 41,746 orders (42.0%), and SP, RJ and MG together make up 66.6% of all orders.
2. **Cancellation rate:** 625 orders (0.63%) are `canceled` and 609 (0.61%) are `unavailable`; 97.0% are `delivered`. About 1.7% are still in progress.
3. **Monthly sales:** Using Jan 2017 to Aug 2018 (other months have almost no orders), sales peak in Nov 2017 at about 1.01M, possibly related to Black Friday. Jan to Aug 2018 sales are about 2.4 times Jan to Aug 2017.
4. **Top categories:** `health_beauty`, `watches_gifts` and `bed_bath_table` lead. No single category dominates (the largest is 9.3%); the top 3 account for 25.8% of sales and the top 10 for 62.4%.

Sales = sum of item `price`, excluding freight.

## Data quality notes

- 775 orders have no items (mostly `unavailable` and `canceled`). They are kept for the cancellation analysis and excluded from sales.
- 1,603 item rows have no product category and are labeled "Unknown" instead of dropped.
- `payments` and `reviews` were aggregated to one row per order before joining, to avoid duplicated rows and double-counted money.

## How to run

1. Download the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle. The data is not included in this repository.
2. Put the CSV files in a `data/` folder.
3. Open the notebook and run all cells.
# E-commerce Analytics Project (dbt + BigQuery)

## Overview

This project transforms raw e-commerce transactional data into analytics-ready datasets using dbt and BigQuery.
The goal of the project is to build modular data models for customer revenue analysis, order aggregation, and top customer identification.

## Tech Stack

* dbt
* BigQuery
* SQL

## Data Source

Brazilian E-Commerce Public Dataset (Olist) from Kaggle:

[Olist E-commerce Dataset](https://www.kaggle.com/datasets/sangamsharmait/ecommerce-orders-data-analysis/data?select=olist_orders_dataset.csv&utm_source=chatgpt.com)

## Project Structure

### Staging Layer

* `stg_customers`
* `stg_orders`
* `stg_order_payments`

Used to clean and standardize raw source data.

### Intermediate Layer

* `orders_with_revenue`

Combines order and payment information to calculate revenue per order.

### Mart Layer

* `customer_revenue`
* `customer_orders_summary`
* `top_customers`

Business-focused analytical models used for customer-level insights.

## Features

* Modular dbt architecture (staging → intermediate → marts)
* Data transformations using SQL and dbt
* Data quality tests:

  * not_null
  * unique
  * relationships
* Customer revenue calculations
* Top customer ranking analysis

## Example Insights

* Customer lifetime revenue
* Number of orders per customer
* Top spending customers
* Order-level revenue metrics

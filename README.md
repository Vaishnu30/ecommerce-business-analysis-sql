# 📊 E-Commerce Business Analysis (SQL + Power BI)

> Business-driven e-commerce analysis using SQL (SQLite) and Power BI  
> Focused on revenue, customers, orders, and delivery performance

---

## 🧠 Project Overview

This project analyzes a real-world **e-commerce dataset** to extract meaningful  
**business insights** using **SQL (SQLite)**.

A local SQLite database was created from multiple CSV files, and all analysis was
performed using optimized SQL queries.

The goal of this project is to demonstrate **practical data analyst skills**, including:
- Data exploration and transformation
- Business metric calculation
- Data quality validation
- Analytical and business-oriented thinking

---

## 🎯 Objectives

- Understand customer distribution and purchasing behavior  
- Analyze order volume and revenue trends  
- Evaluate delivery performance and logistics efficiency  
- Ensure data quality before generating insights  

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|-----|--------|
| **SQL (SQLite)** | Data analysis |
| **SQLite Database** | Data storage |
| **Power BI** | Dashboard visualization |
| **GitHub** | Version control & portfolio |

---

## 🗂️ Database Schema

**Tables used:**
- `customers`
- `orders`
- `order_items`
- `products`

---

## 📊 Key Business Questions Answered

- How many customers and orders exist?
- What are the most popular product categories?
- Which states generate the highest revenue?
- How does revenue change month over month?
- Who are the top 10 customers by spending?
- What is the average order value?
- How efficient is the delivery process?
- How much cost is spent on logistics (freight)?

---

## 📌 Business KPIs Defined

- **Total Revenue**: Sum of item prices for delivered orders
- **Total Orders**: Count of delivered orders
- **Average Order Value (AOV)**: Revenue ÷ total delivered orders
- **Total Customers**: Distinct customer count
- **Monthly Revenue Trend**: Revenue grouped by delivery month

---

## 🔍 Key Insights

- Revenue is calculated **only from delivered orders** to ensure accuracy  
- A small group of customers contributes a large share of total revenue  
- Certain states consistently outperform others in sales  
- Some orders are delivered later than the estimated delivery date  
- Freight costs represent a significant operational expense  

---

## ✅ Data Quality Checks

The following checks were performed before analysis:

- ✔ Verified uniqueness of `order_id`
- ✔ Checked NULL values in order lifecycle timestamps
- ✔ Validated price and freight values
- ✔ Identified orphan order items without matching orders

---

## 📁 Repository Structure

ecommerce-sql-analysis/

├── sql/
  
  │  └── analysis.sql

├── powerbi_dashboard.png
  
├── README.md



---

## 📈 Power BI Dashboard

Below is a snapshot of the Power BI dashboard created to visualize insights derived from SQL analysis:

![Power BI Dashboard](powerbi_dashboard.png)

📌 The Power BI (.pbix) file is not included due to file size limitations.  
The dashboard was built using aggregated outputs from SQL queries.

---

## 📌 Dataset & Database

- **Dataset:** Brazilian E-Commerce Public Dataset by Olist  
- **Source:** Kaggle  
- **Link:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The original dataset consists of multiple CSV files containing customer, order,
product, and logistics information.

A **SQLite database** was created locally by importing and modeling these CSV files.
The database file is not included in this repository due to size constraints.

---

## 🚀 Key Learnings

- Writing complex SQL queries using joins, CTEs, and aggregations  
- Translating business questions into analytical SQL solutions  
- Performing data validation before analysis  
- Structuring analytics projects for real-world use cases  

---

## 👤 Author

**Vaishnavi Yadav**  
Aspiring Data Analyst  
📍 SQL | Data Analysis | Business Insights  

---

⭐ *If you found this project useful, feel free to star the repository!*

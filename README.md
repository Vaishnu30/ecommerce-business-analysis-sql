# 📊 E-Commerce SQL Analysis

> **Business-driven SQL analysis of an e-commerce dataset using SQLite**  
> Focused on revenue, customers, orders, and delivery performance.

---

## 🧠 Project Overview

This project analyzes an **e-commerce dataset** to extract meaningful **business insights** using **SQL**.  
A **SQLite database** was created, and all analysis was performed using optimized SQL queries.

The goal is to demonstrate **real-world data analyst skills**, including:
- Data exploration
- Business metric calculation
- Data quality validation
- Analytical thinking

---

## 🎯 Objectives

- Understand customer distribution and behavior  
- Analyze order volume and revenue trends  
- Evaluate delivery performance and logistics costs  
- Ensure data quality before deriving insights  

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|----|----|
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

## 🔍 Key Insights

- Revenue is calculated **only from delivered orders** to ensure accuracy  
- A small group of customers contributes a large portion of total revenue  
- Certain states consistently outperform others in sales  
- Some orders are delivered later than the estimated delivery date  
- Freight costs form a significant operational expense  

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

├── dashboards/
  
  │  └── Power BI dashboard

├── README.md


---

## 📈 Dashboard

🔗 **Power BI Dashboard**  
👉 _Add your Power BI dashboard link here_

---

## 📌 Dataset & Database

- **Dataset Source:** Brazilian E-Commerce Public Dataset by Olist  
- **Platform:** Kaggle  
- **Link:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The original dataset consists of multiple CSV files containing customer, order,
product, and logistics information.

A **SQLite database** was created locally by importing and modeling these CSV files.
The database file is not included in this repository due to file size limitations.

---

## 🚀 Key Learnings

- Writing complex SQL queries using joins, CTEs, and aggregations  
- Translating business questions into analytical SQL  
- Importance of data validation in analytics  
- Structuring SQL projects for real-world use cases  

---

## 👤 Author

**Vaishnavi Yadav**  
Aspiring Data Analyst  
📍 SQL | Data Analysis | Business Insights  

---

⭐ *If you found this project useful, feel free to star the repository!*

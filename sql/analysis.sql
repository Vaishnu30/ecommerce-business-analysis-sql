/*
SQL Business Analysis Project
Dataset: E-Commerce Orders
Focus:
- Revenue & customer behavior
- Logistics and delivery performance
- Monthly trends
- Data quality validation
*/

-- select * from products;
-- select * from customers;
-- select * from orders;
-- select * from order_items;

-- Total Products
select count(*) from products;

-- Product COunt by category
SELECT product_category_name, COUNT(product_id) as cnt
from products
group by product_category_name
order by cnt desc;


-- Total Customers
SELECT COUNT(DISTINCT customer_id) FROM customers;

-- Customers from states
SELECT COUNT(distinct(customer_state)) from customers;

--Customer Count By States
select customer_state, COUNT(*) as cnt 
from customers 
group by customer_state 
order by cnt desc;


-- Total Order Count
select COUNT(order_id) from orders;

-- Different Order Statuses
select DISTINCT(order_status) from orders;

-- order count by status
select order_status, COUNT(*) as cnt
from orders 
group by order_status
order by cnt desc;

--  Order Time Range
select MAX(order_purchase_timestamp), MIN(order_purchase_timestamp) 
from orders;

-- Orders Per month
select COUNT(order_id) as order_cnt, strftime('%Y-%m', order_delivered_customer_date) as month 
from orders
where order_status= 'delivered'
and order_purchase_timestamp IS NOT NULL
group by month 
order by month;

-- Orders Count by Customers
select customer_id, COUNT(order_id) as orders_cnt
from orders
where order_status='delivered'
group by customer_id
order by orders_cnt desc;

-- Order Items Count
select COUNT(*)
from order_items;

-- Item Count By Order_id
select order_id, COUNT(order_id) as item_count
from order_items
group by order_id
order by item_count desc;


-- Total Customer Order Payment
WITH Customer_Order_Payment AS
(
select o.customer_id, oi.order_id, SUM(oi.price+oi.freight_value) as Payment
from order_items oi
left JOIN Orders o ON oi.order_id=o.order_id
where o.order_status='delivered'
group by oi.order_id
)
select customer_id, COUNT(order_id) as `orders`, SUM(Payment) as total_pay 
from Customer_Order_Payment
group by customer_id;


-- Logistics Cost
select SUM(freight_value) as Logistics_Cost
from order_items;

-- Total Revenue
select SUM(oi.Price) as Revenue
from order_items oi
LEFT JOIN orders o
on oi.order_id=o.order_id
where o.order_status='delivered';

-- Revenue by State
select c.customer_state as State, SUM(oi.Price) as Revenue_by_State
from customers c
LEFT JOIN orders o on c.customer_id=o.customer_id
LEFT JOIN order_items oi on o.order_id=oi.order_id
where o.order_status='delivered'
group by c.customer_state
order by Revenue_by_State desc;


-- Monthly Revenue
SELECT 
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Top 10 customers
WITH Customer_Order_Payment AS
(
    SELECT 
        o.customer_id,
        oi.order_id,
        SUM(oi.price + oi.freight_value) AS Payment
    FROM order_items oi
    JOIN orders o 
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.customer_id, oi.order_id
)

SELECT 
    customer_id,
    SUM(Payment) AS total_spent
FROM Customer_Order_Payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- Average Order VALUES
WITH Order_Value AS
(
    SELECT 
        oi.order_id,
        SUM(oi.price + oi.freight_value) AS order_value
    FROM order_items oi
    JOIN orders o 
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.order_id
)

SELECT AVG(order_value) AS Avg_Order_Value
FROM Order_Value;

-- Delivery Performance
SELECT
    CASE 
        WHEN julianday(order_delivered_customer_date) 
             <= julianday(order_estimated_delivery_date)
        THEN 'On Time'
        ELSE 'Late'
    END AS delivery_status,
    COUNT(*) AS orders_count
FROM orders
WHERE order_status = 'delivered'
GROUP BY delivery_status;


-- Delivery Performance Analysis
SELECT
    AVG(
        julianday(order_delivered_customer_date) -
        julianday(order_estimated_delivery_date)
    ) AS avg_delay_days
FROM orders
WHERE order_status = 'delivered';


-- -------------------------- 
-- Check NULLs in key timestamps
SELECT
    SUM(order_purchase_timestamp IS NULL) AS purchase_nulls,
    SUM(order_approved_at IS NULL) AS approved_nulls,
	SUM(order_delivered_carrier_date IS NULL) AS delivered_carrier_nulls,
	SUM(order_delivered_customer_date IS NULL) AS delivered_nulls,
	SUM(order_estimated_delivery_date IS NULL) AS estimated_delivery_nulls
FROM orders;

-- Price and freight sanity
SELECT
    COUNT(*) AS total_rows,
    SUM(price IS NULL) AS price_nulls,
    SUM(freight_value IS NULL) AS freight_nulls,
    SUM(price <= 0) AS invalid_price
FROM order_items;

SELECT order_id, COUNT(*) AS cnt
FROM orders
GROUP BY order_id
HAVING cnt > 1;

-- order_items without matching orders
SELECT COUNT(*)
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

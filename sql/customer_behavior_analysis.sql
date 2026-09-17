-- Retail Customer Behavior & Sales Intelligence
-- SQL dialect: PostgreSQL
-- Dataset: customer_shopping_behavior_clean.csv
-- The table below is one row per customer purchase record.

DROP TABLE IF EXISTS customer_behavior;

CREATE TABLE customer_behavior (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount NUMERIC(10,2),
    location VARCHAR(100),
    size VARCHAR(10),
    color VARCHAR(50),
    season VARCHAR(20),
    review_rating NUMERIC(3,1),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(50),
    discount_applied VARCHAR(10),
    promo_code_used VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(50),
    frequency_of_purchases VARCHAR(50),
    age_group VARCHAR(20),
    customer_segment VARCHAR(20),
    discount_flag INT,
    promo_flag INT
);

-- Load the cleaned CSV with your local path:
-- \copy customer_behavior FROM 'data/customer_shopping_behavior_clean.csv' CSV HEADER;

-- Q1. Revenue and average order value by category
SELECT category, COUNT(*) AS orders,
       ROUND(SUM(purchase_amount),2) AS revenue,
       ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior
GROUP BY category
ORDER BY revenue DESC;

-- Q2. Revenue by gender
SELECT gender, COUNT(*) AS customers,
       ROUND(SUM(purchase_amount),2) AS revenue,
       ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior
GROUP BY gender
ORDER BY revenue DESC;

-- Q3. Subscribers vs non-subscribers
SELECT subscription_status,
       COUNT(*) AS customers,
       ROUND(AVG(purchase_amount),2) AS avg_order_value,
       ROUND(SUM(purchase_amount),2) AS revenue
FROM customer_behavior
GROUP BY subscription_status
ORDER BY revenue DESC;

-- Q4. Customers who used a discount but spent above the overall average
SELECT customer_id, item_purchased, purchase_amount
FROM customer_behavior
WHERE discount_applied = 'Yes'
  AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customer_behavior)
ORDER BY purchase_amount DESC;

-- Q5. Top 5 products by average review rating
SELECT item_purchased,
       ROUND(AVG(review_rating),2) AS avg_rating,
       COUNT(*) AS orders
FROM customer_behavior
GROUP BY item_purchased
ORDER BY avg_rating DESC, orders DESC
LIMIT 5;

-- Q6. Standard vs Express shipping
SELECT shipping_type,
       COUNT(*) AS orders,
       ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type;

-- Q7. Products with the highest discount rate (minimum 100 orders)
SELECT item_purchased,
       COUNT(*) AS orders,
       ROUND(100.0 * AVG(discount_flag),2) AS discount_rate_pct
FROM customer_behavior
GROUP BY item_purchased
HAVING COUNT(*) >= 100
ORDER BY discount_rate_pct DESC
LIMIT 10;

-- Q8. Customer segmentation
SELECT customer_segment,
       COUNT(*) AS customers,
       ROUND(SUM(purchase_amount),2) AS revenue,
       ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior
GROUP BY customer_segment
ORDER BY revenue DESC;

-- Q9. Top 3 products within each category using a window function
WITH ranked_products AS (
    SELECT category, item_purchased,
           COUNT(*) AS orders,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY COUNT(*) DESC, item_purchased
           ) AS product_rank
    FROM customer_behavior
    GROUP BY category, item_purchased
)
SELECT category, product_rank, item_purchased, orders
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category, product_rank;

-- Q10. Repeat buyers (>5 previous purchases) by subscription status
SELECT subscription_status,
       COUNT(*) AS repeat_buyers
FROM customer_behavior
WHERE previous_purchases > 5
GROUP BY subscription_status
ORDER BY repeat_buyers DESC;

-- Q11. Revenue contribution by age group
SELECT age_group,
       COUNT(*) AS orders,
       ROUND(SUM(purchase_amount),2) AS revenue,
       ROUND(100.0 * SUM(purchase_amount) /
             SUM(SUM(purchase_amount)) OVER (),2) AS revenue_share_pct
FROM customer_behavior
GROUP BY age_group
ORDER BY revenue DESC;

-- Q12. Payment method performance
SELECT payment_method,
       COUNT(*) AS orders,
       ROUND(SUM(purchase_amount),2) AS revenue,
       ROUND(AVG(purchase_amount),2) AS avg_order_value
FROM customer_behavior
GROUP BY payment_method
ORDER BY revenue DESC;

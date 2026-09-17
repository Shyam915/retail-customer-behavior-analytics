# Power BI Dashboard Build Guide

## Dashboard title
**Retail Customer Behavior & Sales Intelligence**

## KPI cards
1. Total Revenue
2. Total Orders
3. Average Order Value
4. Average Rating
5. Subscriber Share

## Visual layout
- Top row: KPI cards
- Left: Revenue by Category (clustered column)
- Center: Revenue by Age Group (column)
- Right: Revenue by Subscription Status (donut)
- Bottom-left: Top 10 Products by Revenue (horizontal bar)
- Bottom-center: Customer Segment Mix (donut/bar)
- Bottom-right: Payment Method Revenue (bar)

## Slicers
Gender, Category, Season, Subscription Status, Shipping Type, Customer Segment.

## Data model
Use the cleaned CSV as one fact-style table named `customer_behavior`.
No date table is required because the source dataset contains no transaction date.

## Important analytical limitation
Do not create a fake time trend. The source has no purchase date. A future version should add a validated transaction-date field before monthly/weekly trend analysis.

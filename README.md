# Retail Customer Behavior & Sales Intelligence

An end-to-end Data Analytics portfolio project using **Python, SQL, Power BI and Excel** to analyze retail customer purchasing behavior.

> **Portfolio note:** This project is an independent implementation inspired by the end-to-end workflow shown in the referenced Amlan Mohanty tutorial. It is not presented as the original creator's work.

## Business Problem
A retail business wants to understand customer purchasing behavior, revenue drivers, subscription patterns, discount usage and product performance in order to make better merchandising, retention and promotion decisions.

## Dataset
- 3,900 records
- 3,900 unique customer IDs
- 18 original fields
- 37 missing review ratings
- No duplicate rows
- No transaction date

## Tools
- Python: Pandas, NumPy, Matplotlib
- SQL: PostgreSQL
- Power BI
- Excel
- Git / GitHub

## Workflow
1. Business problem definition
2. Data quality audit and cleaning in Python
3. Feature engineering and exploratory data analysis
4. SQL business analysis
5. Power BI dashboard design
6. Report and presentation
7. GitHub portfolio packaging

## Key Results
- Total recorded purchase value: **$233,081**
- Average order value: **$59.76**
- Average review rating after median imputation: **3.75**
- Subscriber share: **27.0%**
- Discount usage: **43.0%**
- Highest-revenue category: **Clothing**

## Repository Structure
```text
retail-customer-behavior-analytics/
├── data/
│   ├── customer_shopping_behavior_raw.csv
│   └── customer_shopping_behavior_clean.csv
├── python/
│   ├── retail_customer_behavior_analysis.ipynb
│   └── clean_customer_data.py
├── sql/
│   └── customer_behavior_analysis.sql
├── powerbi/
│   ├── POWER_BI_BUILD_GUIDE.md
│   ├── DAX_measures.txt
│   └── shyam_retail_theme.json
├── report/
│   ├── business_problem.md
│   ├── Retail_Customer_Behavior_Analysis_Report.pdf
│   └── retail_customer_behavior_analysis.xlsx
├── presentation/
│   └── Retail_Customer_Behavior_Portfolio_Presentation.pptx
└── assets/
    └── dashboard_preview.png
```

## Important Limitation
The source data does not contain transaction dates. Therefore, this project intentionally does **not** claim monthly/weekly revenue trends. A production version should add a validated transaction date before time-series analysis.

## Resume Version
**Retail Customer Behavior & Sales Intelligence | Python, SQL, Power BI**
- Cleaned and analyzed 3,900 retail customer records using Python/Pandas, engineered customer segments and validated data quality.
- Developed PostgreSQL queries using aggregations, CASE logic, CTEs and window functions to analyze revenue, products, subscriptions and customer behavior.
- Designed an interactive Power BI dashboard specification with KPI measures and category, age-group, product and subscription analysis.

## Interview One-Liner
"I built an end-to-end retail analytics project where I cleaned and explored customer data in Python, answered business questions with PostgreSQL, and designed a Power BI dashboard to turn the findings into business insights."

## Source / Learning Reference
The project workflow was inspired by the tutorial and public repository:
https://github.com/amlanmohanty1/customer-trends-data-analysis-SQL-Python-PowerBI

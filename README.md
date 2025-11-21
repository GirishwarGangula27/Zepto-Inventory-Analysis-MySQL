# Zepto-Inventory-Analysis-MySQL
MySQL-based data cleaning, transformation, and analysis on Zepto’s 3,700+ product inventory dataset.

# Project Overview

This project focuses on performing end-to-end data cleaning, transformation, and analysis using MySQL.
A dataset containing 3,700+ product entries from Zepto’s inventory was imported from a CSV file and processed to extract actionable insights such as revenue estimation, discount analysis, product ranking, and inventory health checks.
This project helped me strengthen my SQL skills across data cleaning, transformation, and analytical problem-solving.

# 1. Data Cleaning & Preparation

Key steps performed:
- Standardized inconsistent values (TRUE/FALSE - Available/Unavailable)
- Removed rows with missing or zero MRP or selling price
- Converted paise - rupees using SQL arithmetic
- Renamed confusing or unclear column names
- Formatted data types to ensure consistent querying
- Verified data accuracy with sanity checks

# 2. Exploratory Data Analysis (EDA)

Insights generated:
- Number of products per category
- Stock availability distribution
- Most expensive items by MRP
- Duplicate product names across categories
- Items marked "available" but with zero quantity
- Out-of-stock analysis for each category

# 3. Advanced SQL Analysis

Advanced functions and analytical queries:
- Estimated revenue per category + overall total (using UNION ALL)
- Weighted average discount per category
- Window functions to rank products within each category by discount
- Identify categories with maximum out-of-stock items
- Build restock alerts for low-quantity products
- Detect mismatched entries and data inconsistencies

# 4. Tools & Skills Used

- MySQL Workbench
- Advanced SQL Functions: Window functions, aggregations, UNION ALL, HAVING, etc.
- Data Cleaning techniques
- Analytical problem solving

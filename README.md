# Zepto Inventory Analysis (MySQL)
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

# 5. Key Insights from the Project

- Inventory skew heavily toward certain categories
- Weighted discount varies widely by category
- Several products repeat across multiple categories
- High-MRP items often remain unavailable
- Estimated revenue highlights top-performing categories
- Restock alerts reveal items with critically low availability<img 

<img width="1683" height="477" alt="1" src="https://github.com/user-attachments/assets/7652f8e2-afef-4615-9739-a8f24b9f93d7" /> 
<img width="1682" height="622" alt="2" src="https://github.com/user-attachments/assets/21d69388-6b8d-49bf-a8cb-602052f434f2" /> 
<img width="1913" height="822" alt="3" src="https://github.com/user-attachments/assets/ca13c622-afbd-48ce-a40b-cb52e150586f" /> 
<img width="1918" height="852" alt="4" src="https://github.com/user-attachments/assets/27c32277-bee3-49c5-9e1c-fdb82290c519" />
<img width="1916" height="848" alt="5" src="https://github.com/user-attachments/assets/3f164a36-9d40-4068-839e-5f367133c07a" />
<img width="1915" height="612" alt="6" src="https://github.com/user-attachments/assets/19140e53-4120-4eed-96c8-a5bc7b92ddbd" />
<img width="1915" height="848" alt="7" src="https://github.com/user-attachments/assets/143bfe12-63d5-4eac-b50c-722a7f4317f9" />
<img width="1918" height="575" alt="8" src="https://github.com/user-attachments/assets/326754fe-ed8b-47ee-a830-2806575871bb" />

# 6. Contact

- If you'd like to collaborate or provide feedback, feel free to reach out!
- Gmail - girish27.gangula@gmail.com
- Linkedin - Girishwar Gangula

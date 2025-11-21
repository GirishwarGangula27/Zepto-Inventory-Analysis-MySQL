create database project;

use project;

create table zepto(
Sku_id Serial,
Category varchar(255),
Name varchar(255),
Mrp decimal(8,2),
DiscountPercent decimal(6,2),
AvailableQuantity int,
DiscountedSellingPrice decimal(8,2),
WeightinGms int,
OutofStock varchar(25),
Quantity int);

-- Data Exploration --

-- Count of Rows
SELECT Count(*) 
FROM zepto;

-- Sample Data
SELECT * 
FROM zepto
LIMIT 10;

-- Null Values
SELECT Count(Null) 
FROM zepto;

-- Types of Product Category
SELECT Category, 
	Count(*) AS 'Number of Product Category' 
FROM zepto
GROUP BY Category
ORDER BY Category;

-- Data Cleaning --

-- Change outofstock column data for betterunderstanding
UPDATE zepto
SET OutofStock = 'Available'
WHERE OutofStock = 'FALSE';

UPDATE zepto
SET OutofStock = 'Unavailable'
WHERE OutofStock = 'TRUE';

-- Change Column Name
ALTER TABLE zepto
RENAME COLUMN OutofStock 
TO Availability;

-- Product with price - 0
SELECT * FROM zepto
WHERE Mrp = 0 
OR DiscountedSellingPrice = 0;

DELETE FROM zepto
WHERE Mrp = 0 
OR DiscountedSellingPrice = 0;

-- Convert paise to rupees
UPDATE zepto
SET Mrp = Mrp/100.0, DiscountedSellingPrice = DiscountedSellingPrice/100.0;

-- Data Analysis --

-- 1. All products that are currently out of stock.
SELECT Name 
FROM zepto
	WHERE Availability = 'Unavailable';

-- 2. Top 10 most expensive items based on mrp.
SELECT Name, 
	Mrp 
FROM zepto
ORDER BY Mrp DESC
LIMIT 10;

-- 3. Products with High MRP but Out of Stock.
SELECT 
	Name, 
    Mrp 
FROM zepto
WHERE Availability = 'Unavailable'
ORDER BY Mrp DESC
LIMIT 10;

-- 4. Count how many products exist in each Category.
SELECT Category, 
	Count(Name) AS 'Number of Products'
FROM zepto
GROUP BY Category
ORDER BY 'Number of Products';

-- 5. Number of product in stock & out of stock
SELECT Availability, 
	Count(Sku_id) AS 'stock Details'
FROM zepto
GROUP BY Availability;

-- 6. Product names present multiple times
SELECT Name, 
	Count(Sku_id) AS 'Number of SKUs'
FROM zepto
GROUP BY Name
HAVING count(Sku_id) > 1
ORDER BY count(Sku_id) DESC;

-- 7. Categories with more than 200 products.
SELECT Category, 
	Count(Name) AS 'Total Products'
FROM zepto
GROUP BY Category
HAVING Count(Name) > 200
ORDER BY Count(Name) DESC;

-- 8. All products where AvailableQuantity = 0 but Availability = Available
SELECT * 
FROM zepto
WHERE AvailableQuantity = 0 
AND Availability = 'Available';

-- 9. Total inventory weight per category.
SELECT Category, 
	Sum(AvailableQuantity * WeightinGms) AS 'Total Weight (Gms) of Available Quantity'
FROM zepto
GROUP BY Category
ORDER BY Sum(AvailableQuantity * WeightinGms);

-- 10. Total Estimated Revenue
SELECT Category, 
	Sum(AvailableQuantity * DiscountedSellingPrice) as 'Estimated Revenue'
FROM zepto
GROUP BY Category

UNION ALL

SELECT 'Total Estimated Revenue' AS Category, 
	Sum(AvailableQuantity * DiscountedSellingPrice) 
		AS 'Estimated Revenue'
FROM zepto
ORDER BY 'Estimated Revenue';

-- 11. Rank products within each category by highest discount
SELECT 
    Category,
    Name,
    discountPercent,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY discountPercent DESC
    ) AS DiscountRank
FROM zepto;

-- 12. Find which category has the maximum out-of-stock count.
SELECT Category, 
	Count(Availability) AS 'Number of Stock Unavailable'
FROM zepto
WHERE Availability = 'Unavailable'
GROUP BY Category
ORDER BY Count(Availability) DESC
LIMIT 1;

-- 13. Restock Alert.
SELECT
	Category,
    Name,
    AvailableQuantity
FROM zepto
WHERE AvailableQuantity < 3 AND Availability = 'Available'
ORDER BY AvailableQuantity;

-- 14. Duplicate product names across categories.
SELECT 
	Name, 
    Category
FROM zepto
WHERE Name IN (
	SELECT Name
	FROM zepto
	GROUP BY Name
	HAVING COUNT(DISTINCT Category) > 1
)
ORDER BY Name, Category;

-- 15. Weighted average discount for each category.
SELECT Category,
	Round(Sum(DiscountPercent * AvailableQuantity) / Sum(AvailableQuantity), 2)
		AS 'Weighted Avg Discount'
FROM zepto
GROUP BY Category;

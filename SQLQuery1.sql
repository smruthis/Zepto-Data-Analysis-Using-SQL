create database zepto;

use zepto;

drop table if exists zepto

select * from zepto_v2;

select count(*) from zepto_v2;

--sample data
select top 10 * from zepto_v2;

--null values
select * from zepto_v2 where name is null
or mrp is null or discountPercent is null or
availableQuantity is null or discountedSellingPrice is null
or weightInGms is null or outOfStock is null
or quantity is null;

--different product categories
select distinct category from zepto_v2
order by category;

--products in stock vs out of stock
select outofstock, count(*) from zepto_v2
group by outOfStock;

--product names present multiple times
select name,count(*) as 'Number of Stock Keeping Units'
from zepto_v2
group by name
having count(*)>1
order by count(*) desc;

--DATA CLEANING
select* from zepto_v2
where mrp = 0 or discountedSellingPrice = 0;

--deleting the row where mrp is 0 since this is not possible
Delete from zepto_v2
where mrp = 0;

--convert paise to rupees
update zepto_v2
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;
 
--BUSINESS QUERIES
-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT top 10 name, mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC;

--Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp
FROM zepto_v2
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT top 5 category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(CAST(weightInGms AS INT) * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;

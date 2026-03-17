# 🛒 Zepto SQL Data Analysis Project

This project demonstrates a complete **end-to-end SQL data analysis workflow** using an e-commerce inventory dataset inspired by Zepto, one of India’s fastest-growing quick-commerce platforms.

It replicates how data analysts work with real-world messy data and transform it into meaningful business insights.

## 🎯 Project Objective

- Build a structured database from raw data  
- Perform **Exploratory Data Analysis (EDA)**  
- Clean and transform inconsistent data  
- Write **business-focused SQL queries**  
- Generate insights on pricing, inventory, and revenue  

---

## 📁 Dataset Overview

- Source: Kaggle (Zepto-inspired dataset)  
- Duplicate product names exist due to:
  - Different packaging  
  - Different weights  
  - Discount variations  
  - Multiple listings (real-world scenario)  

### 🧾 Columns:

- `name` → Product name  
- `category` → Product category  
- `mrp` → Maximum Retail Price (₹)  
- `discountPercent` → Discount percentage  
- `discountedSellingPrice` → Final selling price  
- `availableQuantity` → Inventory quantity  
- `weightInGms` → Product weight  
- `outOfStock` → Stock availability (TRUE/FALSE)  
- `quantity` → Units per package  

---

## 🔧 Project Workflow

- Tool used - Microsoft SQL Server
- Created a database named as 'Zepto'
- Imported the dataset

## 🔍 Exploratory Data Analysis (EDA)

- Counted total records  
- Viewed sample dataset  
- Checked null values  
- Identified unique categories  
- Compared in-stock vs out-of-stock products  
- Found duplicate product entries (multiple SKUs)  

---

##  🧹 Data Cleaning

- Removed rows where MRP or price = 0  
- Converted price from paise to rupees  
- Standardized data for analysis  

---

##  📊 Business Insights

- Top 10 products with highest discounts  
- High-MRP products that are out of stock  
- Estimated revenue per category  
- Expensive products (MRP > ₹500) with low discounts  
- Top 5 categories with highest average discounts  
- Price-per-gram analysis for value comparison  
- Product grouping based on weight (Low / Medium / Bulk)  
- Total inventory weight per category  



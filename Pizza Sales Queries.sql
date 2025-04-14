-- Raw Data
select * from pizza_sales;

-- Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales;

-- Average Order Value
select sum(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales;

-- Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

-- Total Orders
select count(distinct order_id) as Total_Orders from pizza_sales;

-- Average Pizza Per Order
select cast(sum(quantity) as decimal (10,2)) / cast(count(distinct order_id) as decimal (10,2)) as Total_Pizza_Sales_Per_Order from pizza_sales;

-- Daily Trend
select datename(dw, order_date) as order_day, count(distinct order_id) as Total_Orders from pizza_sales group by datename(dw, order_date);

-- Monthly Trend
select datename(month, order_date) as Month_Name, count(distinct order_id) as Total_Orders from pizza_sales group by datename(month, order_date);

-- Percentage of Total Sales
select pizza_category as Pizza_Category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT_Total_Sales from pizza_sales group by pizza_category;

-- Pizza Sales by Month
select pizza_category as Pizza_Category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) = 1) as PCT_Total_Sales from pizza_sales where month(order_date) = 1 group by pizza_category;

-- Pizza Size Sales
select pizza_size as Pizza_Size, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT_Total_Sales from pizza_sales group by pizza_size;

-- Top 5 Pizza Name
select top 5 pizza_name as Pizza_Name, sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue desc;

-- Bottom 5 Pizza Name
select top 5 pizza_name as Pizza_Name, sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue asc;

-- Top 5 Quantity
select top 5 pizza_name as Pizza_Name, sum(quantity) as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity desc;

-- Bottom 5 Quantity
select top 5 pizza_name as Pizza_Name, sum(quantity) as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity asc;

-- Top 5 Orders
select top 5 pizza_name as Pizza_Name, sum(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders desc;

-- Bottom 5 Orders
select top 5 pizza_name as Pizza_Name, sum(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders asc;

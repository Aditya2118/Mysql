-- 1. Create a database.

Create database Walmart;
-----------------------------------------------------------------------------------------------

-- 2. Use any database. 
 
Use Walmart;
-- --------------------------------------------------------------------------------------------

-- 3. Viewing the database

select * from sales;
-- --------------------------------------------------------------------------------------------

-- 4. Add a new column named "day_name", that contains the extracted days of the week
-- on which the given transaction took place.

select date,
DAYNAME(date) as day_name
from sales;

alter table sales add column day_name varchar(10);

update sales
set day_name = DAYNAME(date);

select * from sales;
-- -------------------------------------------------------------------------------------------------

-- 5. Add a new column named "month_name" that contain the extracted months of the year 
-- on which the given transaction took place. 

select date,
MONTHNAME(date)
from sales;

alter table sales add column month_name varchar(10);

update sales 
set month_name = MONTHNAME(date);

select * from sales;
-- ---------------------------------------------------------------------------------------------------

-- 6. Fetch the time in which the transaction has been done.

Select 
time from sales;
-- ----------------------------------------------------------------------------------------------------

-- 7. Fetch the city name in which they has each branch?

select 
distinct branch
from sales ; 
-- In the above query we get to know that how much distinct brances are there. 

select distinct city,
branch 
from sales ;
-- ---------------------------------------------------------------------------------------------------

-- 8. What is the most common payment method?

Select
payment,
count(payment) as cnt
from sales
group by payment
order by cnt desc;
-------------------------------------------------------------------------------------------------------

-- 9. What is the most selling product line?

Select
Product_line,
count(Product_line) as cnt
from sales
group by Product_line
order by cnt desc;
------------------------------------------------------------------------------------------------------

-- 10. What is the total revenue by the month?

Select month_name as month,
sum(total) as total_revenue
from sales
group by month_name
order by total_revenue desc;
------------------------------------------------------------------------------------------------------

-- 11. What month had the largest COGS?

Select month_name as month,
sum(cogs) as cogs
from sales 
group by month_name
order by cogs desc;
---------------------------------------------------------------------------------------------------

-- 12. What product line had the largest revenue?

Select
product_line,
sum(total)as total_revenue
from sales
group by product_line
order by total_revenue desc;
-------------------------------------------------------------------------------------------------------

-- 13. What is the city with the largest revenue?

Select
branch,
city,
sum(total)as total_revenue
from sales
group by city, branch
order by total_revenue desc;
------------------------------------------------------------------------------------------------------

-- 14. Which branch sold more product than average product sold?

Select branch,
sum(quantity)as qty
from sales
group by branch
having sum(quantity)>(select avg(quantity)from sales);
------------------------------------------------------------------------------------------------------

-- 15. What is the most common product_line by the gender?

Select gender,
product_line,
count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;
------------------------------------------------------------------------------------------------------

-- 16. What is the average rating of the each product_line?

select avg(rating) 
as avg_rating,
product_line
from sales
group by product_line
order by avg_rating desc;
-------------------------------------------------------------------------------------------------------

-- 17. Count the number of total sales made in days in the week.

select * from sales;
Select
day_name,
count(*) as total_sales
from sales
group by day_name
order by total_sales desc;
-------------------------------------------------------------------------------------------------------

-- 18. Count the number of total sales made on a sunday only.

Select
day_name,
count(*) as total_sales
from sales
where day_name = "Sunday"
group by day_name
order by total_sales desc;
-------------------------------------------------------------------------------------------------------

-- 19. Which of the customer types brings the most revenue?

Select * from sales;
Select customer_type,
sum(total) as total_rev
from sales
group by customer_type
order by total_rev desc;
-------------------------------------------------------------------------------------------------------

-- 20. Which city has the largest tax percent?

Select city,
avg(tax) as tax
from sales
group by city
order by tax desc;
-------------------------------------------------------------------------------------------------------

-- 21. Which customer type pays the most in tax?

Select * from sales;
Select customer_type,
avg(tax) as tax
from sales
group by customer_type
order by tax desc;
-------------------------------------------------------------------------------------------------------

-- 22. How many unique customer types does the data have?

Select * from sales;
Select distinct 
customer_type
from sales;
-------------------------------------------------------------------------------------------------------

-- 23. How many unqiue payment methods does the data have?

Select * from sales;
Select distinct 
payment
from sales;
-------------------------------------------------------------------------------------------------------

-- 24. Which customer type buys the most?

Select * from sales;
Select  
customer_type,
count(*)  as cstm_cnt
from sales
group by customer_type;
-------------------------------------------------------------------------------------------------------

-- 25. What is the most common gender of the cutomers?

select 
gender,
count(*) as gender_cnt
from sales
group by gender
order by gender_cnt desc;
-------------------------------------------------------------------------------------------------------

-- 26. What is the gender distribution per branch?

select 
gender,
count(*) as gender_cnt
from sales
where branch = "B"
group by gender
order by gender_cnt desc;
-------------------------------------------------------------------------------------------------------

-- 27. Which day the customer gives the most rating?

select day_name,
avg(rating)as avg_rating
from sales
group by day_name
order by avg_rating desc;
-------------------------------------------------------------------------------------------------------

-- 28. Which of the day do customers give most rating per branch?

select day_name,
avg(rating)as avg_rating
from sales
where branch = "A"
group by day_name
order by avg_rating desc;
-------------------------------------------------------------------------------------------------------

-- 29. Which day of the week has the best rating so far?

select 
day_name,
avg(rating)as avg_rating
from sales
group by day_name
order by avg_rating desc;
-------------------------------------------------------------------------------------------------------

-- 30. Which day of the week has the best avereage rating per branch?

select 
day_name,
avg(rating)as avg_rating
from sales
where branch = "A"
group by day_name
order by avg_rating desc;

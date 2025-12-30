-- retrieve all records 
select * from sales;

-- count how many records in the table 
select count(*) from sales;

-- Data cleaning process find null values in table 
select * from sales 
where 
transaction_id is null 
or 
sale_date is null 
or
sale_time is null 
or 
gender is null
or  
quantiy is null 
or 
cogs is null
or
total_sale is null;

-- Data Analysis & business key problems & Answer 

-- Q1 write a sql query to retrieve all columns for sales made on '2022-11-05'

select * from sales 
where sale_date = '2022-11-05';

-- Q2 write a sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.

select * from sales 
where category = 'clothing'
 and 
 quantiy >= 4
and
 month(sale_date) = 11
and 
 year(sale_date) = 2022;
 
 -- Q3 write a sql query to calculate the total sales  (total_sale) for each category
 
 select category , 
 sum(total_sale) as total_sales
 from sales 
 group by category;
 
 -- Q4 write a sql query to find the average age of customers who purchased items from the 'beauty' category.

select avg(age) as avg_age 
from sales 
where category = 'beauty';

-- Q5 write a sql query to find all transactions where the total_sale is greater than 1000

select * 
from sales 
where total_sale >1000;

-- Q6 write a sql query to find the total number of transactions (transaction_id) made by each gender in each category

select gender, category , count(transaction_id) as total_trans 
from sales 
group by 
gender, category;

-- Q7 write a sql query to calculate the average sale for each month find out best selling month in each year

select
      extract(year from sale_date) as year,
      extract(month from sale_date) as month,
      avg(total_sale) as avg_sale
from sales
group by 1,2
order by 1, 3 desc;

select
      extract(year from sale_date) as year,
      extract(month from sale_date) as month,
      avg(total_sale) as avg_sale,
      rank() over (partition by extract(year from sale_date) order by avg(total_sale) desc) as rnk
from sales
group by 1,2;

-- Q8 write a sql query to find the top 5 customers based on the highest total sales

select customer_id,
sum(total_sale) as total_sales
from sales 
group by 1
order by total_sales desc
limit 5;

-- Q9 write a sql query to find the number of unique customers who purchased items from each category

select
 category ,
 count(distinct customer_id) as unique_customers
from sales
group by category;

-- Q10 write a sql query to create each shift and number of orders (example morning <12, afternoon between 12 & 17, evening >17

with hourly_sale 
as
(
select * , 
case 
     when extract(hour from sale_time) <12 then 'morning'
     when extract(hour from sale_time) between 12 and 17 then 'afternoon'
     else 'evening'
     end as shift 
     from sales
     )
     select shift, 
     count(*) as total_orders 
     from hourly_sale
     group by shift;
     
    -- End of Project 
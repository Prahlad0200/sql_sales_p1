# sql_sales_p1

count how many records in the table 
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

-- Q2 write a sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.

 -- Q3 write a sql query to calculate the total sales  (total_sale) for each category
 
 -- Q4 write a sql query to find the average age of customers who purchased items from the 'beauty' category.

-- Q5 write a sql query to find all transactions where the total_sale is greater than 1000

-- Q6 write a sql query to find the total number of transactions (transaction_id) made by each gender in each category

-- Q7 write a sql query to calculate the average sale for each month find out best selling month in each year

-- Q8 write a sql query to find the top 5 customers based on the highest total sales

-- Q9 write a sql query to find the number of unique customers who purchased items from each category

-- Q10 write a sql query to create each shift and number of orders (example morning <12, afternoon between 12 & 17, evening >17

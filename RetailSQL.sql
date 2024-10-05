#Total Sales
select sum(total_sale) from sales;

#Total Customers
select count(distinct customer_id) from Sales;

#Stats of a Particular Day
select * from Sales where sale_date="2022-11-05";

#Where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select * from Sales where category="Clothing" and quantiy>4 and month(sale_date)=11;

#Sales by Category
select category,sum(total_sale) from sales group by category;

#Average Age of Beauty Category
select avg(age) from sales where category="Beauty";

#Transactions Above 1K
select * from sales where total_sale>1000;

#Transactions Category & GenderWise
select category,gender,count(ï»¿transactions_id) from sales group by category,gender order by category;

#Average Sale of Each Month + Rush Month
select month(sale_date),avg(total_sale) from sales group by month(sale_date) order by month(sale_date) ; 
select month(sale_date),avg(total_sale) from sales group by month(sale_date) order by avg(total_sale) desc limit 1 ; 

#Top 5 Customers
select customer_id , total_sale from sales order by total_sale desc limit 5;

#Customers by Ctaegory
select category,count(distinct customer_id) from sales group by category;

#Schedule Wise Sales
with cte as(
	select * , 
    case
    when extract(hour from sale_time) < 12 then "Morning"
    when extract(hour from sale_time) between 12 and 17 then "AfterNoon"
    when extract(hour from sale_time) > 12 then "Night"
    end as "Shift"
    from sales
)
select Shift,count(ï»¿transactions_id) from cte group by Shift;

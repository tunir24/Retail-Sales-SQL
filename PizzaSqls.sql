#Total Orders
select count(order_id) from orders;

#Total Revenue
select sum(order_details.quantity*pizzas.price) from order_details join pizzas on pizzas.pizza_id = order_details.pizza_id;

#Top Priced Pizza
select price , pizza_types.name from pizzas join pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id order by price desc limit 1 ;

#Most Ordered Size 
select size , sum(quantity) from order_details join pizzas on order_details.pizza_id = pizzas.pizza_id group by size order by sum(quantity) desc limit 1;

#Top 5 Most Ordered Pizzas
select pizza_types.name , sum(quantity) from order_details join pizzas on order_details.pizza_id = pizzas.pizza_id join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id group by pizza_types.name order by sum(quantity) desc limit 5;

#Orders by Pizza Category
SELECT 
    pizza_types.category, SUM(quantity)
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY SUM(quantity);

#Pizzas By Category
select distinct category , count(pizza_type_id) from pizza_types group by category;

#Top 3 By Revenue
select pizzas.pizza_id , sum(order_details.quantity*pizzas.price) as rev from order_details join pizzas on pizzas.pizza_id = order_details.pizza_id group by pizzas.pizza_id order by rev desc limit 3;  ;

#Rush Hour
select hour(time),count(order_id)as total from orders group by hour(time) order by total desc limit 1;

#Average Orders Per Day
with cte as(
select orders.date , count(order_details_id) as ORD from order_details join orders on order_details.order_id = orders.order_id group by orders.date 
)
select avg(ORD) from cte;


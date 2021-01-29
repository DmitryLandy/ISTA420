.echo on
.headers on
.mode csv

-- Name: Dmitry Landy
-- File: tsql-ex03-landy.sql
-- Date: January 28, 2021

-- 1. We have noticed that certain customers prefer to make their orders with certain employees. We want to increase business by encouraging the customer/employee pairs that are more productive, and to channel the pairs that are less productive into other relationships. To this end, we have ordered this query and the following three. 

--First, I need the customer ID, the customer contact name, the employee ID, the employee name, the order ID, the number of orders, and the total amount of each order, where the customer/employee pair has produced five or more orders between them, ordered by the dollar amount of the order from highest to lowest. The output needs to be in a comma separated format with strings that include spaces and commas delimited by double quotes. The dollar amount should be formatted as a decimal number with two decimal places.

select c.customerid, c.contactname, e.employeeid, e.firstName||' '||e.lastname as employee_name, o.orderid, count(o.orderid) as num_orders, printf("%.2f",sum(od.unitprice*od.quantity)) as order_total from customers as c join orders as o on c.customerid = o.customerid join employees as e on o.employeeid = e.employeeid join order_details as od on od.orderid = o.orderid group by o.orderid having count(o.orderid) >= 5 order by order_total desc;

-- 2. Second, I want the least productive pairs with the same columns. The total of orders should be less than three, the dollar amount of the order is less than $50.00, and the orders are ranked by increasing dollar amounts, starting with the least order.

select c.customerid, c.contactname, e.employeeid, e.firstName||' '||e.lastname as employee_name, o.orderid, count(o.orderid) as num_orders, printf("%.2f",sum(od.unitprice*od.quantity)) as order_total from customers as c join orders as o on c.customerid = o.customerid join employees as e on o.employeeid = e.employeeid join order_details as od on od.orderid = o.orderid group by o.orderid having num_orders <= 3 and sum(od.unitprice*od.quantity) < 50 order by sum(od.unitprice*od.quantity) asc;

-- 3. Third, I need the most productive pairs as in the first report above, omitting the order ID but ranked by the average amount from highest to lowest of all orders by the customer/employee pair. Include only pairs where the amount of the average exceeds $2,500.00.

select c.customerid, c.contactname, e.employeeid, e.firstName||' '||e.lastname as employee_name, count(o.orderid) as num_orders, printf("%.2f",avg(od.unitprice*od.quantity)) as order_avg from customers as c join orders as o on c.customerid = o.customerid join employees as e on o.employeeid = e.employeeid join order_details as od on od.orderid = o.orderid group by o.orderid having avg(od.unitprice*od.quantity) > 2500 order by order_avg desc;


-- 4. Finally, I need the least productive pairs as ranked by average order amount, from lowest to highest, formatted as above. Omit the order ID. Include only pairs where the average order amount is less than $50.00.

select c.customerid, c.contactname, e.employeeid, e.firstName||' '||e.lastname as employee_name, count(o.orderid) as num_orders, printf("%.2f",avg(od.unitprice*od.quantity)) as order_avg from customers as c join orders as o on c.customerid = o.customerid join employees as e on o.employeeid = e.employeeid join order_details as od on od.orderid = o.orderid group by o.orderid having avg(od.unitprice*od.quantity) < 50 order by order_avg asc;

-- 5. Please create a report with the order ID, the customer ID, the customer name, the customer country, and the dollar amount of the order, sorted alphabetically by country and numerically from highest to lowest by the dollar amount of the order, where the order total exceeds $5,000.00.

select o.orderid, c.customerid, c.companyName, c.country, printf("%.2f",sum(od.unitprice*od.quantity)) as total_order from customers as c join orders as o on c.customerid = o.customerid join order_details as od on od.orderid = o.orderid group by o.orderid having  sum(od.unitprice*od.quantity) > 5000 order by country asc, total_order desc;

-- 6. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers and employees, (b) where we have customers but no employees AND both customers and employees, and (c) where we have employees but no customers AND both customers and employees. Write three queries, using inner and outer joins. Report the results of the queries.

.mode columns

select distinct c.city as customer_city, e.city as employee_city, c.region as customer_region, e.region as employee_region, c.postalCode as customer_postal, e.postalcode as employee_postal from customers as c inner join employees as e on c.city = e.city;

select distinct c.city as customer_city, e.city as employee_city, c.region as customer_region, e.region as employee_region, c.postalCode as customer_postal, e.postalcode as employee_postal from customers as c left outer join employees as e on c.city = e.city;

select distinct c.city as customer_city, e.city as employee_city, c.region as customer_region, e.region as employee_region, c.postalCode as customer_postal, e.postalcode as employee_postal from employees as e left outer join customers as c on c.city = e.city;
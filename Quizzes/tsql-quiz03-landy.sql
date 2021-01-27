.echo on
.headers on

-- Name: Dmitry Landy
-- File: TSQL Quiz03-landy.sql
-- Date: January 26, 2021

--1. Write a report giving the employee id, first name, last name, and the average amount of all orders by that employee. Use the SQL 92 syntax. Do not use a group by clause. 

select distinct e.employeeid, e.firstname, e.lastname, avg(od.unitprice*od.quantity) over( partition by e.employeeid) as average_sales from employees as e join orders as o on e.employeeid = o.employeeid join order_details as od on o.orderid = od.orderid order by average_sales desc;

--In some cities, we have customers, suppliers, and employees. Write a report that lists the customer's contact name, the supplier's contact name, the employee's name, and the city in which all three are located. Use the SQL 92 syntax. Do not use a group by clause.

select c.contactname as customer_contact, s.contactname as supplier_contact, e.firstname||' '||e.lastname as employee_name, c.city as employee_name from customers as c join suppliers as s on c.city = s.city join employees as e on e.city = s.city;

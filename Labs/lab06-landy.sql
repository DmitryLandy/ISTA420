-- Name: Dmitry Landy
-- File: lab06-landy.sql
-- Date: 2/8/2021

use TSQLV4;
-- 1. Find employee IDs who had orders in both January, 2016 and February, 2016.

(select o.empiD from Sales.Orders as o where o.orderdate like ('2016-01-%'))

intersect

(select o.empid from Sales.Orders as o where 
	o.orderdate >= '20160201' and o.orderdate < '20160301')

-- 2. Find employee IDs who had orders in both January, 2016 and February, 2016.

(select o.empiD from Sales.Orders as o where o.orderdate like ('2016-01-%'))

union

(select o.empid from Sales.Orders as o where 
	o.orderdate >= '20160201' and o.orderdate < '20160301')

-- 3. Find employee IDs who had orders in both 2016 but not in 2014.

(select o.empiD from Sales.Orders as o where o.orderdate like ('2016-%'))

except

(select o.empid from Sales.Orders as o where 
	o.orderdate >= '20140101' and o.orderdate < '20141231')

-- 4. cities and countries where we have both customers and employees

select e.city, e.country from hr.employees as e

intersect

select c.city, c.country from Sales.Customers as c

-- 5. cities and countries where we have either customers or employees

select e.city, e.country from hr.employees as e

union

select c.city, c.country from Sales.Customers as c

-- 6. cities and countries where we have customers but not employees

select c.city, c.country from Sales.Customers as c
except
select e.city, e.country from hr.employees as e

-- 6. cities and countries where we have employees but not customers

select e.city, e.country from hr.employees as e

except

select c.city, c.country from Sales.Customers as c

-- 6. cities and countries where we have employees but not customers 
-- cities and countries where we have customers but not employees

(select e.city, e.country from hr.employees as e
union
select c.city, c.country from Sales.Customers as c)

except

(select c.city, c.country from Sales.Customers as c
intersect
select e.city, e.country from hr.employees as e)

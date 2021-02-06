-- Name: Dmitry Landy
-- File: tsql-ex04-landy.sql
-- Date: 2/5/2021
use TSQLV4;

--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.
declare @custnumber as int = 10;

select t1.custid, t1.orderyear, count(distinct t1.productid) product_count
from (select o.custid, year(o.orderdate) orderyear, od.productid
	from sales.OrderDetails od join sales.orders as o on od.orderid = o.orderid)  as t1
where t1.custid = @custnumber
group by t1.custid, t1.orderyear 
order by t1.custid, t1.orderyear

--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.

--look at customer, country, and year of each country's customer orders
declare @customerCountry nvarchar(15) = N'France';

with t1(country,orderyear,productid)
as
(
	--definition	
	--sales.orders: custid, orderdate
	--sales.customers: custid, country
	--sales.orderdetails: orderid, productid

select c.country, year(o.orderdate), od.productid
from sales.orders as o
	join sales.OrderDetails as od
		on o.orderid = od.orderid
	join sales.Customers as c
		on o.custid = c.custid
),
t2(country, orderyear, product_count)
as
(
select t1.country, t1.orderyear, count(distinct t1.productid)
from t1
group by country, orderyear
)

select t2.country, t2.orderyear, t2.product_count
from t2
where t2.country = @customerCountry
order by t2.country, t2.orderyear


--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.

--sales.customers: country, custid
--sales.orderdetails: unitprice, orderid,
--sales.orders: orderdate, orderid, custid



drop view if exists Sales.VOrderTotalsByCountry;
go
create view Sales.VOrderTotalsByCountry
as
select c.country, year(o.orderdate) as orderyear, sum(od.unitprice*od.qty) as total_amount
from sales.customers as c
	join sales.orders as o
		on c.custid = o.custid
	join sales.OrderDetails as od
		on od.orderid = o.orderid
group by c.country, year(o.orderdate)

go

--4. Create an inline table valued function that accepts as a parameter a country name and returns a table
--with the distinct products ordered by customers from that country. Products are to be identied by
--both product ID and product name.

	-- sales.customer: custid, country
	-- sales.orderDetails: productid,orderid
	-- sales.orders: custid, orderid
	-- production.products: productid, productname

drop function if exists sales.GetUniqueProducts;
go
create function sales.GetUniqueProducts(@country nvarchar(15))
returns table 
as 
return
(
select distinct p.productid, p.productname, c.country
from sales.Customers as c
join sales.Orders as o
	on c.custid = o.custid
join sales.OrderDetails as od
	on od.orderid = o.orderid
join Production.Products as p
	on p.productid = od.productid
where c.country = @country
)
go

select * from sales.GetUniqueProducts(N'France') order by productid;

--5. Use the CROSS APPLY operator to create a query showing the top three products shipped to customers
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.-- production.products: productid, productname-- sales.customers: custid, country-- sales.orders: custid, orderid-- sales. orderDetails: orderid, productid, qtyselect sub.shipcountry, sub.productid, sub.productname, sub.qtyfrom(select ROW_NUMBER() over(partition by o.shipcountry order by o.shipcountry) as rowNum, o.shipcountry, p.productid, p.productname, sum(od.qty) as qtyfrom production.products as pcross apply(select * from sales.orderdetails as od where p.productid = od.productid) as odcross apply(select * from sales.orders as o where o.orderid = od.orderid) as ogroup by o.shipcountry, p.productid, p.productname) as subwhere rowNum < 4order by sub.shipcountry, qty desc
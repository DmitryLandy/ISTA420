-- Name: Dmitry Landy
-- File: quiz04-landy.sql
-- Date: 2 Feb 2021
---------------------------------------------------------------------
USE TSQLV4;

--1. Write a query that returns the company name, contact name, and city of all customers who made an
--order on the last date that orders were taken. Use nested self contained, list valued subqueries in the
--WHERE clause. Your output should be as follows:

--Customer RTXGC Raghav, Amritansh Marseille
--Customer NYUHS Moore, Michael Albuquerque
--Customer CCKOT Myrcha, Jacek Genve
--Customer JMIKW Gonzalez, Nuria Kobenhavn

select c.companyname, c.contactname, c.city 
from sales.Customers as c
where c.custid in 
	(select  o.custid from Sales.Orders as o where o.orderdate in 
		(select top (1) o2.orderdate from sales.orders as o2 order by o2.orderdate desc));

--2. Write a query that returns the company name, contact name, and city of all customers who made an
--order in July, 2014. Use nested self contained, list valued subqueries in the WHERE clause. Your
--output should be as follows:

--Customer QXVLA Bansal, Dushyant Strasbourg
--Customer VMLOG Benito, Almudena Mxico D.F.
--Customer WNMAF Jelitto, Jacek Bern
--Customer THHDP Kane, John Graz
--Customer CYZTN Grisso, Geoff Brcke
--Customer AZJED Carlson, Jason Mnchen
--Customer FVXPQ Yuksel, Ayca Caracas
--Customer IBVRG Zhang, Frank Rio de Janeiro
--Customer UMTLM Langohr, Kris San Cristbal
--Customer QNIVZ Miller, Lisa Kln
--Customer WULWD Meisels, Josh Rio de Janeiro
--Customer NYUHS Moore, Michael Albuquerque
--Customer CCKOT Myrcha, Jacek Genve
--Customer SFOGW Luper, Steve Charleroi
--Customer FAPSM Wickham, Jim Mnster
--Customer NRCSK Tuntisangaroon, Sittichai Lyon
--Customer ENQZT Elliott, Patrick Reims
--Customer ZHYOS Ludwig, Michael Oulu
--Customer SRQVM Li, Yan Resende
--Customer YBQTI Smith Jr., Ronaldo Seattle

select c.companyname, c.contactname, c.city from Sales.Customers as c
where c.custid in
(select o.custid from sales.orders as o where o.orderdate like ('2014-07-%'));


--3. Write a query that returns the customer ID, order ID, order date, and the unit price of the highest
--priced item in the order for all orders shipped to Norway. Use a self contained, scalar valued subquery
--in the SELECT clause. Your output should be as follows:

--70 10387 2014-12-18 44.00
--70 10520 2015-04-29 32.80
--70 10639 2015-08-20 62.50
--70 10831 2016-01-14 263.50
--70 10909 2016-02-26 30.00
--70 11015 2016-04-10 25.89

select o.custid, o.orderid, o.orderdate,
(select max(od.unitprice) from sales.OrderDetails as od	
	where o.orderid = od.orderid) as Highest_price
from sales.orders as o
where o.shipcountry like 'Norway';

------------------------------------





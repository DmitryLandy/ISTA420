--Name: Dmitry Landy
--File: tsql-quiz05-landy.sql
--Date: 2/9/2021
------------------------------------

--The purpose of the report is to analyze the monthly sales for all products. We need the information
--described below. The column names and descriptions are shown. The query should return 1162 rows.
--Use the TSQLV4 database with SQL Server. The data will be found in the tables Sales.Orders and
--Sales.OrderDetails. Create a query according to the following instructions, You may want to use a CTE
--joining the appropriate tables to start your query. Use window functions to perform the calculations.
--Grading: There are ten columns. Each column represents 10% of the grade. 100 points total.

use TSQLV4;--1. productid : the product ID, aggregated by product ID--2. monthyear : the month and year aggregation, includes all products sold during the monthwith C1(productid, monthYear, qty)as(select 	od.productid,  	DATEFROMPARTS(Year(o.orderdate), Month(o.orderdate), 1), 	qtyfrom sales.Orders as o	join sales.OrderDetails as od 	on od.orderid = o.orderid),--3. thisMonth : the total quantity of all of this product sold this monthC2as(select 	productid, 	monthYear,	sum(qty) as thisMonth from C1group by C1.productid, C1.monthYear),--4. lastMonth : the total quantity of all of the product sold last month
C3as(select *, 	lag(thisMonth) over (partition by productid order by monthyear) as lastMonth	from	C2),--5. diff : the difference between the sales of this month and last monthC4as(select *,	(thisMonth - lastMonth) as difffrom C3),--6. pctIncDec : the percent increase/decrease between this month and last month--7. running : the running total of monthly sales for this product
C5as(select *,	Cast((100.0 *diff/lastMonth) as decimal(10,2))as pctIncDec,	sum(thisMonth) over (partition by productID order by monthyear		rows between unbounded preceding and current row)as runningfrom C4),--8. pctChange : the percent of this months sales to last months sales
--9. totalPerProduct : grand total of all of this product sold for all months
C6as(select *,	Cast((100.0 *thisMonth/lastMonth) as decimal(10,2))as pctChange,	sum(thisMonth) over (partition by productID)as totalPerProduct	from C5),--10. pctLinePerProduct : percent of the total sold this month against the grand total for the productC7as(select *,	Cast((100.0 *thisMonth/totalPerProduct) as decimal(10,2))as pctLinePerProductfrom C6)--run final queryselect * from C7
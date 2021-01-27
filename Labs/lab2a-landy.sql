.echo on
.headers on

-- Name: Dmitry Landy
-- File: lab2a-landy.sql
-- Date: January 19, 2021

-- 1. What are the regions?

select * from region;

-- 2. What are the cities?

select * from territories;

-- 3. What are the cities in the Southern region?

select * from territories where RegionID = 4;

-- 4. How do you run this query with the fully qualified column name?

select territories.TerritoryID, territories.TerritoryDescription, territories.RegionID 
	from territories where RegionID = 4;

-- 5. How do you run this query with a table alias?

select T.TerritoryID, T.TerritoryDescription, T.RegionID 
	from territories T where RegionID = 4;

-- 6. What is the contact name, telephone number, and city for each customer?

select c.ContactName, c.Phone, c.City from customers c;

-- 7. What are the products currently out of stock?

select p.ProductID, p.ProductName, p.UnitsInStock from products p where UnitsInStock = 0;

-- 8. What are the ten products currently in stock with the least amount on hand?

select p.ProductID, p.ProductName, p.UnitsInStock from products p where UnitsInStock > 0 order by UnitsInStock limit 10;

-- 9. What are the five most expensive products in stock?

select p.Unitprice, p.ProductID, p.ProductName, p.UnitsInStock  from products p where unitsinstock > 0 order by unitprice desc limit 5;

-- 10. How many products does Northwind have? How many customers? How many suppliers?

select count(productId) from products;
select count(customerId) from customers;
select count(supplierId) from suppliers;


.echo on
.headers on

-- Name: Dmitry Landy
-- File: TSQL Quiz02-landy.sql
-- Date: January 20, 2021

-- 1. How many seafood products do we have?

select categoryid, count(productid) from products where categoryID = 8;

-- 2. What are the names and IDs of our seafood products?

select productid, productname from products where categoryID = 8;

-- 3. What is the average price of our seafood products?

select categoryid, avg(unitprice) from products where categoryid=8;

-- 4. What is our highest priced seafood product, and how much does it cost?

select productid, categoryid, productname, unitprice from products where categoryid = 8 order by unitprice desc limit 1;

-- 5. What is our lowest priced seafood product, and how much does it cost?

select productid, categoryid, productname, unitprice from products where categoryid = 8 order by unitprice asc limit 1;

-- 6. How many customers do we have in Denmark?

 select country, count(country) from customers where country like 'denmark';
 
-- 7. What are the customer names and IDs of our Danish customers?

select customerid, companyname, country from customers where country like 'denmark';

-- 8. Which customers do NOT have a fax number? This one is very tricky!

select customerid, companyname, fax from customers where fax like '';

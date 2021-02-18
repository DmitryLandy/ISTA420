-- Name: Dmitry Landy
-- File: tsql-ex06-landy.sql
-- Date: 2/17/2021
-----------------------

use classicCars;

-- Product Lines Table
------------------------------------------------------------------------------------------

drop table if exists dbo.ProductLines;

go
CREATE TABLE dbo.ProductLines
(
  productLine varchar(50) primary key,
  textDescription varchar(1000),
  htmlDescription varchar(500),
  imagePath varchar(200)
);

bulk insert dbo.ProductLines 
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\productLines.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Products Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Products;

go
CREATE TABLE dbo.Products
(
  productCode varchar(50) primary key,
  productName varchar(100),
  productLine varchar(100),
  productScale varchar(10),
  productVendor varchar(100),
  productDescription varchar(1000),
  quantityInStock int,
  buyPrice float,
  MSRP float
);

bulk insert dbo.Products 
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\products.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- offices Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Offices;

go
CREATE TABLE dbo.Offices
(
  officeCode varchar(10) primary key,
  city varchar(50),
  phone varchar(100),
  addressLine1 varchar(100),
  addressLine2 varchar(100),
  officeState varchar(50),
  country varchar(50),
  postalCode varchar(20),
  territory varchar(50)
);

bulk insert dbo.Offices
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\Offices.csv'
with
(
	format = 'csv',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Employees Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Employees;

go
CREATE TABLE dbo.Employees
(
  employeeNumber varchar(20) primary key,
  lastName varchar(50),
  firstName varchar(50),
  extension varchar(30),
  email varchar(100),
  officeCode varchar(10) references dbo.offices(officeCode),
  reportsTo varchar(10),
  jobTitle varchar(50)  
);

bulk insert dbo.Employees
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\Employees.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Customers Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Customers;

go
CREATE TABLE dbo.Customers
(
  customerNumber int primary key,
  customerName varchar(50),
  contactLastName varchar(50),
  contactFirstName varchar(50),
  phone varchar(20),
  addressLine1 varchar(100),
  addressLine2 varchar(100),
  city varchar(50),
  customerState varchar(50),
  postalCode varchar (10),
  country varchar(50),
  employeeNumber varchar(20) references dbo.Employees(employeeNumber),
  creditLimit float
  
);

bulk insert dbo.Customers
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\Customers.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Orders Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Orders;

go
CREATE TABLE dbo.Orders
(
  orderNumber int primary key,
  orderDate varchar(100),
  requiredDate varchar(100),
  shippedDate varchar(100),
  orderStatus varchar(50),
  comments varchar(500),
  customerNumber int references dbo.Customers(customerNumber)
);

bulk insert dbo.Orders
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\orders.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Order Details Table
------------------------------------------------------------------------------------------
drop table if exists dbo.OrderDetails;

go
CREATE TABLE dbo.OrderDetails
(
	constraint PK_OrderDetails primary key(orderNumber, productCode),
	orderNumber int references dbo.Orders(orderNumber),
	productCode varchar(50) references dbo.products(ProductCode),	
	quantity int,
	price decimal,
	orderLineNumber int
  
);

bulk insert dbo.OrderDetails
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\OrderDetails.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)

-- Payments Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Payments;

go
CREATE TABLE dbo.Payments
(
	constraint PK_Payments primary key(customerNumber, checkNumber),
	customerNumber int references dbo.Customers(customerNumber),
	checkNumber varchar(20),	
	paymentDate date,
	amount decimal
  
);

bulk insert dbo.Payments
	from 'C:\Users\dmitr\MSSA2021\ISTA420\Exercises\CC-CSV-Files\Payments.csv'
with
(
	format = 'csv',
	fieldquote = '"',
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
)
------------------------------------------------------------------------------------------
---------------------------------------QUERIES--------------------------------------------
------------------------------------------------------------------------------------------

--(a) How many distinct products does ClassicModels sell?
select distinct count(productCode) as totalProducts from dbo.Products

--(b) Report the name and city of customers who don't have sales representatives?
select customerName, city
from dbo.Customers
where employeeNumber like 'NULL'


--(c) What are the names of executives with VP or Manager in their title? 
-- Use the CONCAT function to combine the employee's rst name and last name into a single field for reporting.
select concat(firstName,' ',lastName) as name, jobTitle
from dbo.Employees
where jobTitle like '%VP%' or jobTitle like '%manager%';

--(d) Which orders have a value greater than $5,000?
select orderNumber,  price*quantity as totalPrice
from dbo.OrderDetails
where price*quantity > 5000;

--(e) Report the account representative for each customer.
select distinct c.customerName, concat(e.firstname,' ', e.lastname) as representative, c.employeeNumber
from dbo.Customers as c
join dbo.Employees as e on e.employeeNumber = c.employeeNumber

--(f) Report total payments for Atelier graphique.
select c.customerName, sum(p.amount) as totalPayments
from dbo.Payments as p
join dbo.Customers as c on c.customerNumber = p.customerNumber
group by c.customerName
having c.customerName = 'atelier graphique'

--(g) Report the total payments by date
select paymentDate, sum(amount)
from dbo.Payments
group by paymentDate

--(h) Report the products that have not been sold.

select *
from dbo.products
where productCode like
(
select productCode
from dbo.Products

except

select distinct productCode
from dbo.OrderDetails
)

--(i) List the amount paid by each customer.

select c.customerNumber, c.customerName, sum(p.amount) as totalPaid
from dbo.Payments as p
join dbo.Customers as c on c.customerNumber = p.customerNumber
group by c.customerNumber, c.customerName

--(j) List products sold by order date.
select od.productCode, p.productName, cast(o.orderDate as date) as orderDate
from dbo.Products as p
join dbo.OrderDetails as od on p.productCode = od.productCode
join dbo.Orders as o on o.orderNumber = od.orderNumber
order by orderDate

--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
select cast(o.orderDate as date) as orderDatesForTruck
from Orders as o
join dbo.OrderDetails as od on od.orderNumber = o.orderNumber
where od.productCode = 
(
select productCode
from dbo.Products
where productName like '1940 Ford Pickup Truck'
)
order by o.orderdate desc

--(l) List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?
select c.customerName, o.orderNumber, sum(od.price*od.quantity) as totalOrderPrice
from dbo.Customers as c
join dbo.orders as o on c.customerNumber = o.customerNumber
join dbo.OrderDetails as od on o.orderNumber = od.orderNumber
group by c.customerName, o.orderNumber
having sum(od.price * od.quantity) > 25000

--(m) Compute the commission for each sales representative, assuming the commission is 5% of the value of an order. Sort by employee last name and first name.

select o.orderNumber, e.employeeNumber, e.lastName, e.firstName, (sum(od.price*od.quantity)*.05) as commission
from OrderDetails as od
join orders as o on od.orderNumber = o.orderNumber
join Customers as c on c.customerNumber = o.customerNumber
join Employees as e on c.employeeNumber = e.employeeNumber
group by o.ordernumber, e.employeeNumber, e.lastName, e.firstName
order by e.lastName, e.firstName

--(n) What is the difference in days between the most recent and oldest order date in the Orders file?

select DATEDIFF(day, min(orderdate), max(orderdate)) as dayDifference
from Orders

--(o) Compute the average time between order date and ship date for each customer ordered by the largest difference.
go
with T1 (custNum, custName, diff)
as
(
select c.customerNumber, c.customerName, avg(DATEDIFF(day, cast(orderDate as date), cast(shippedDate as date))) as avgTimeBetweenOrderAndShipDate
from orders as o
join Customers as c on o.customerNumber = c.customerNumber
where orderDate not like 'NULL' and shippedDate not like 'NULL'
group by c.customerNumber, c.customerName
)
select *
from T1
order by diff desc
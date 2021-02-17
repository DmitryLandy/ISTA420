-- Name: Dmitry Landy
-- File: tsql-ex06-landy.sql
-- Date: 2/16/2021
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
	price float,
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

select * from dbo.OrderDetails

-- Payments Table
------------------------------------------------------------------------------------------
drop table if exists dbo.Payments;

go
CREATE TABLE dbo.Payments
(
	constraint PK_Payments primary key(customerNumber, checkNumber),
	customerNumber int references dbo.Customers(customerNumber),
	checkNumber varchar(20),	
	paymentDate varchar(50),
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
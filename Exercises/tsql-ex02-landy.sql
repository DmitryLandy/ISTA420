.echo on
.headers on

-- 1. List the company name, the contact name and the country of all customers in Poland.

select companyName, contactname, country from customers where country like 'Poland';

-- 2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.

select orderid, orderdate, shipCity from orders where shipCity like 'Berlin';

-- 3. How many boxes of Filo Mix do we have in stock?

select productname, unitsinstock from products where productname like 'Filo Mix';

-- 4. List the telephone numbers of all of our shippers.

select shipperid, companyname, phone from shippers;

-- 5. Who is our oldest employee? Who is our youngest employee?

select employeeid, lastname, firstname, birthdate from employees order by birthdate asc limit 1;

select employeeid, lastname, firstname, birthdate from employees order by birthdate desc limit 1;

-- 6. List the suppliers where the owner of the supplier is also the sales contact.

select supplierid, companyname, contacttitle, contactname from suppliers where contacttitle like('%owner%');

-- 7. Mailing Labels
-- From the Northwind database we used in class and SQLite, create mailing labels for customer representatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable for printing on sticky label paper, specifically Avery 8160 labels. The format should be as follows:

-- TITLE FIRSTNAME LASTNAME
-- COMPANYNAME
-- STREET ADDRESS
-- CITY STATE ZIP COUNTRY
-- [blank line]
-- [blank line]

select contactname || char(10) || companyname || char(10) || address || char(10) || city ||' '|| region|| ' ' || postalcode ||' ' ||country || char(10) || char(10) from customers;

-- 8. Telephone Book
-- From the Northwind database we used in class and SQLite, create a telephone book for customer representatives. Each line in the telehone book should consist of the representative last name, representative first name, company name, and telephone number. Each row should look like this.
-- Lastname, Firstname Middlename [tab] Company name [tab] phone number

select substr(ContactName, instr(ContactName, ' ')) || ', '||substr(ContactName,1,instr(contactname, ' '))||char(9)||companyName||char(9)||phone from customers;

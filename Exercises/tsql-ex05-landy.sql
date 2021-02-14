-- Name: Dmitry Landy
-- File: tsql-ex05-landy.sql
-- Date: 2/13/2021
-----------------------
use TSQLV4;

--1. Create an appropriate table schema.
GO
drop table if exists dbo.Presidents;
GO
create table dbo.presidents
(
	ID integer,
	Lastname varchar(50),
	Firstname varchar(50),
	MiddleName varchar(50),
	orderOfPres integer,
	dateOfBirth date,
	dateOfDeath date,
	townOfBirth varchar(50),
	stateOfBirth varchar(50),
	homeState varchar(50),
	party varchar(50),
	dateTookOffice date,
	dateLeftOffice date,
	assassinAttempt varchar(50),
	assassinated varchar(50),
	religion varchar(50),
	imagePath varchar(50)
);


--2. Insert the CSV data into the table you just created.
GO
BULK INSERT dbo.Presidents FROM 'C:\Users\dmitr\MSSA2021\Database\Presidents.txt'
WITH
(
    DATAFILETYPE    = 'char',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '\n'
)

--3. Delete the column that contains the path to the images.
alter table dbo.Presidents drop column imagePath;

--4. Delete the first record from your table using the output clause.
delete from dbo.presidents where ID like 'ID';


--5. Bring the data up to date by updating the last row. Use the output clause.
update dbo.presidents set dateLeftOffice = '2017-01-20' where ID = 44;

----6. Bring the data up to date by adding a new row. Use the output clause.

insert into dbo.presidents
values (45, 'Trump', 'Donald', 'John', 45, '1946-6-14', NULL , 'Queens', 'New York', 'New York', 'Republican', '2017-01-20', '2021-01-20','False', 'False', 'Christian')

insert into dbo.presidents
values (46, 'Biden', 'Joe', 'Robinette', 46, '1942-11-20', NULL, 'Scranton', 'Pennsylvania', 'Pennsylvania', 'Democratic', '2021-01-20', NULL,'False', 'False', 'Catholic')


--7. How many presidents from each state belonged to the various political parties? Aggregate by party
-- and state. Note that this will in effect be a pivot table.
select distinct party, homeState, count(party) as presidentCount
from dbo.presidents
group by party, homestate
order by party, count(party) desc

SELECT 
	[homestate], [Democratic], [Democratic-Republican], [Democratic-Republican/National Republican], [Democratic/National Union], [Independent], [Republican], [Federalist], [Whig], [Republican/National Union]
From
(
	select distinct 
		party, 
		homeState
	from dbo.presidents
) as D
PIVOT
(
	count(party) for party in ([Democratic], [Democratic-Republican], [Democratic-Republican/National Republican], [Democratic/National Union], [Independent], [Republican], [Federalist], [Whig], [Republican/National Union])
) as P



--8. Create a report showing the number of days each president was in office.
select ID, Lastname, Firstname, MiddleName, 
DATEDIFF(day, dateTookOffice, dateLeftOffice) as days_In_Office
from Dbo.presidents

--9. Create a report showing the age (in years) of each present when he took office.

select ID, Lastname, Firstname, MiddleName, 
DATEDIFF(year, dateOfBirth, datetookOffice)-1 as age_Taking_Office
from Dbo.presidents

--10. See if there is any correlation between a president's party and reported religion, or lack of reported
--religion.

select distinct party, religion,
count(party) as presidents_Religion_count
from dbo.presidents
group by party, religion
order by party, count(party) desc

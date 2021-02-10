-- Name: Dmitry Landy
-- File: tsql-ex05-landy.sql
-- Date: 2/9/2021
-----------------------
use TSQLV4;
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

GO
BULK INSERT dbo.Presidents FROM 'C:\Users\dmitr\MSSA2021\Database\Presidents.txt'
WITH
(
    DATAFILETYPE    = 'char',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '\n'
)

alter table dbo.Presidents drop column imagePath;

delete from dbo.presidents where ID like 'ID';

update dbo.presidents set dateLeftOffice = '2017-01-20' where ID = 44;

insert into dbo.presidents
values (45, 'Trump', 'Donald', 'John', 45, '1946-6-14', NULL , 'Queens', 'New York', 'New York', 'Republican', '2017-01-20', '2021-01-20','False', 'False', 'Christian')

insert into dbo.presidents
values (46, 'Biden', 'Joe', 'Robinette', 46, '1942-11-20', NULL, 'Scranton', 'Pennsylvania', 'Pennsylvania', 'Democrat', '2021-01-20', NULL,'False', 'False', 'Catholic')

select * from dbo.presidents;




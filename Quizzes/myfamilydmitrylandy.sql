.echo on
.headers on

-- Name: Dmitry Landy
-- File: myfamilyDmitryLandy.sql
-- Date: January 12, 2021

drop table if exists family;

create table family (
	id int primary key, 
	name text,
	sex int,
	role text,
	weight real
);

insert into family values(1,"William", 1, "parent", 180.5);
insert into family values(2,"Linda", 0, "parent",NULL);
insert into family values(3,"Dee", 0, "wife", NULL);
insert into family values(4,"Boomer", 1, "pet", 70);


select * from family;
select * from family where role like "parent";
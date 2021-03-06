.echo on
.headers on

-- Name: Dmitry Landy
-- File: tsql-ex01-landy.sql
-- Date: January 12, 2021

drop table if exists dogs;

create table dogs (
	id int primary key, 
	name text,
	sex int,
	breed text check (breed = "German Shepherd" or breed = "Labrador" or breed = "Poodle" or breed = "Golden Doodle"),
	weight real,
	birthdate int check (birthdate > 2015)
);

insert into dogs values(1,"Brad", 1, "German Shepherd", 95, 2017);
insert into dogs values(2,"Boomer", 1, "Labrador",70.5, 2018);
insert into dogs values(3,"Fluff", 0, "Poodle", 33, 2019);
insert into dogs values(4,"Kipper", 1, "Golden Doodle", 35.5, 2019);


select * from dogs;
select * from dogs where sex = 1;
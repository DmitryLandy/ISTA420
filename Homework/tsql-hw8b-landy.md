## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 8b HW
## DATE: 2/16/2021
---
**1. The sales tax rate for a state just changed. How would you update the state sales tax table to reflect the changes? Assume that this table has an ID column, an RATE column, and a STATE column.**

```
update dbo.State 
set rate = 8.25
where id = 44
```

**2. The Revenue Division has requested that you provide a report on what the actual sales taxes would have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How would you calculate this?**

- update the sales tax and then run the query with the new sales tax.

**3. Explain how the proprietary assignment update command works.**

- It uses subqueries  when assigning column values.

**4. What is one very important purpose of the MERGE SQL statement? What is ETL (not in book)?**

- MERGE: merge data from a a source to a target, BUT use different actions based on conditional logic.

- ETL: extract-transform-load. A process used to collect data from sources, transform it based on rules, then load it into a database.

**5. What are the semantics of MERGE?**
```
MERGE INTO <table>
Using <table>
	on <condition>
when matched then
	<do this>
when not matched
	<do this>
when not matched by source then
	<delete>
```

**6. Write a typical INSERT OUTPUT statement.**

- Insert into <table> OUTPUT <columns> subquery
- 
**7. Write a typical UPDATE OUTPUT statement.**

- update <table> Set <column and value> OUTPUT <changed/updated columns> where <predicate>

**8. Write a typical DELETE OUTPUT statement.**

- delete from <table> output <deleted columns> where <predicate>

**9. Write a typical MERGE OUTPUT statement.**

- MERGE INTO <table> <logical statements> OUTPUT <columns>

**10. What is nested DML?**

- Directly insert into final target table only a subset of desired rows from a full set of modified data.
- Smaller version of ouput.

**11. (Not in book) Write a query adding a new column to a table named PERSON. The new column name is DayOfBirth and the data type is string. Use ANSI SQL syntax.**

```
alter table person add dayOfBirth varchar(30)
```

**12. (Not in book) Write a query adding a DEFAULT constraint to the column DayOfBirth. The constraint is that the value matches one of SUN, MON, TUE, WED, THU, FRI, or SAT.**
```
ALTER TABLE person  
    ADD CONSTRAINT day_of_week DEFAULT 'MON' FOR dayOfBirth
```

**13. (Not in book) Write a query adding a foreign key to the column DayOfBirth. The referenced table is named WEEK and the referenced column is ValidDay.**
```
ALTER TABLE Person
  ADD CONSTRAINT FOREIGN KEY(validDay) REFERENCES week(validDay);
 ```

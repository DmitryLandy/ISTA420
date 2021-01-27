## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 2a HW
## DATE: 1/17/2021
---
1. **List the order of execution of a SQL query.**
	1. FROM
	1. WHERE
	1. GROUP BY
	1. HAVING
	1. SELECT
	1. ORDER BY

1. **What does the ```from``` clause do?**
	- Specify the table to query from. Uses all the rows from the tables specified.

1. **What does the ```where``` clause do?**
	- Specify a predicate to filter the rows returned in the FROM phase. This is a row filter.

1. **What does the ```group``` by clause do?**
	- Aranges the rows returned the previous query by same values.

1. **What does the ```having``` clause do?**
	- Specifies a predicate to filter groups. This is a group filter

1. **What does the ```select``` clause do?**
	- Specify the columns to be returns

1. **What does the ```distinct``` keyword do?**
	- Remove duplicate rows from the query

1. **What does the ```order by``` clause do?**
	- Sorts the rows of the output for presentation purposes

1. **What does the ```limit``` clause do?**
	- Used to set upper limit for the number of rows returned by the query (standard SQL)

1. **What does the ```top``` clause do?**
	- Limit the number or percentage of rows returned by the query (T-SQL)

1. **What do the ```offset . . . fetch . . .``` clauses do?**
	- ```offset``` indicates how many rows to skip and ```fetch``` indicates how many rows to filter afterwards.


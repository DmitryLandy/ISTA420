## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 3 HW
## DATE: 1/25/2021
---
1. **In general, why would you even want to join two (or more) tables together? This is a good time to think about the nature of relational algebra.**

	- selects all rows between the tables as long as there is a match between the coloumns
	
	- Helps optimize queries where needing relational data from multiple tables in a single query.

2. **Describe in your own words the output from an inner join.**

	- It combines only the data is filtered by the predicate from the multiple tables.

3. **Describe in your own words the output from an outer join.**

	- cartesian product, filter by predicate, add outer rows
	- Compares and combines all data from the tables being compared.

4. **Describe in your own words the output from an cross join.**

	- Simply outputs all possible combinations of the rows from the tables.

5. **A convenient mnemonic for remembering the various joins is “Ohio.” Why is this true?**

	- O: inner join
	- HI: left and right outer join
	- O: outer join

6. **Give an example of a composite join.**

	- Matches multiples attributes from each side
	- ```select x from table1 inner join table2 on table1.col1 = table2.col1 and table1.col2 = table 2.col2;```

7. **What is the difference between the following two queries? The business problem is “How many orders do we have from each customer?”**
```
================first query===============
SELECT C.custid, COUNT(*) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;

================second query===============
SELECT C.custid, COUNT(O.orderid) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;
```
	- 1st query finds customers who have and haven't placed orders.
	- 2nd query finds only customers who have placed orders.

8. **What might be one reason the following query does not return the column custID in this query?**
```
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
WHERE O.orderdate >= ’20160101’;
```
	- Predicate after he ON clause operates on the cartesian product. Then discards from the product anything that doesn't match the predicate after the WHERE clause. 

	- custid from customers is not the same as custid from orders.
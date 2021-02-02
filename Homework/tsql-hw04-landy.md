## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 4 HW
## DATE: 1/31/2021
---
1. **In your own words, what is a subquery?**
- A query within a query. Nested query

2. **In your own words, what is a self contained subquery?**
- Independant of the tables in the outer query 
- it can run by itself
- runs once

3. **In your own words, what is a correlated subquery?**
- Refer to outer tables attributes
- Can't run by itself
- runs once for every row in the outer query

4. **Give an example of a subquery that returns a single value. When would you use this kind of subquery?**
- Subquery would use a aggregate method to return a scalar value.
- max(), min(), avg(), etc.

5. **Give an example of a subquery that returns multiple values. When would you use this kind of subquery?**
- Subquery does not contain an aggregate function, but returns a list
- select custid from customers;

6. **Give an example of a subquery that returns table values. When would you use this kind of subquery?**
- select * from customers;
- set valued subqueries

7. **What does the exists predicate do? Give an example.**
- accepts a subquery as input and returns TRUE if the subquery returns any rows and FALSE otherwise.

- SELECT custid, companyname
FROM Sales.Customers AS C
WHERE country = N'Spain'
  AND EXISTS
    (SELECT * FROM Sales.Orders AS O
     WHERE O.custid = C.custid);

8. **What happens if we use the not operator before a predicate? Give an example.**
- it gives us the opposite of the predicate result. Reverses the truth value.

- SELECT custid, companyname
FROM Sales.Customers
WHERE custid NOT IN(SELECT O.custid
                    FROM Sales.Orders AS O);

9. **When you use exists or not exists with respect to a row in a database, does it return two or three values? Explain your answer.**
- It returns only one value: true or false

10. **How would you use a subquery to calculate aggregates? For example, you want to calculate yearly sales of a product, and you also want to keep a running sum of total sales. Explain how you would use a subquery to do this.**
- You would take the sum of the subquery results

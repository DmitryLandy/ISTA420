## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 6 HW
## DATE: 2/7/2021
---
**1. What does a set operator do?**

- Combine rows from two query result sets

**2. What are the general requirements of a set operator**
- Same number of columns
- Types have to be compatible

```
Input Query1
<set_operator>
Input Query2
[ORDER BY ...];
```
**3. What is a Venn Diagram? This is not in the book.**

A diagram that shows relationships between objects of the diagram

**4. Draw a Venn Diagram of the UNION operator. What does it do?**

- Unifies results of two input queries (distinct)

- (non-distinct)( distinct from both) (non distinct)

**5. Draw a Venn Diagram of the UNION ALL operator. What does it do?**

- unifies two input query results without filtering for distinct results
- (  ) ( both input queries) (  )

**6. Draw a Venn Diagram of the INTERSECT operator. What does it do?**

- Shows common results of both input queries
- (non common ) (common in both) (non common)

**7. If SQL Server supported the INTERSECT ALL operator, what would it do?**

- Duplicate intersections will not be removed

**8. Draw a Venn Diagram of the EXCEPT operator. What does it do?**

- Shows results from the first diagram except the intersection.

- (show this )(not this - the common part) (or this - the right table)

**9. If SQL Server supported the EXCEPT ALL operator, what would it do?**

- Shows only occurances of a row from the left set that do no have occurances in the right set

**10. What is the precedence of the set operators?**

- INTERSECT, EXCEPT/UNION (depends on order)

**11. The symmetric difference of two sets A and B is all elements in A that are also not in A and B, and all elements of B that are also not in A and B. For example, if set A consisted of all integers between 1 and 100 that are divisible by 2, and set B consisted of all integers between 1 and 100 that are divisible by 3, the symmetric difference of A and B would include all integers in A and B except integers divisible by both 2 and 3, e.g., 6, 12, 18, etc. Write a SQL query that computes the symmetric difference of two tables A and B.**

- a except b union b except a

- 

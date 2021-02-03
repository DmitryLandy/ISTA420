## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 5 HW
## DATE: 2/1/2021
---
**1. What is a table expression? Can you give a technical definition of a table expression?**
- a named query expression that represents a valid relational table. 
- Can be used anywhere a table is accepted in the query.
- 4 types: derived tables, CTEs, views, inline table-valued functionws

**2. In what SQL clause are derived tables (table valued subqueries) located?**
- FROM clause of the outer query.

**3. Why can you refer to column aliases in an outer query that you defined in an inner table valued subquery?**
- Because the inner query gets unnested and essentially merges into one query

**4. What SQL key word defines a common table expression?**
- CTE defined using WITH statement.

**5. When using common table expressions, can a subsequent derived table use a table alias declared in a preceding table expression?**
- Yes, each CTE can refer to all previously defined CTEs

**6. Can a main query refer to a previously defined common table expression by multiple aliases?**
- yes, because the CTE already exists up to the FROM clause.

**7. In SQL, is a view a durable object?**
- Yes, views are stored as permanent object.
- Only the query for the view is saved, not the data.

**8. In a view, what does WITH CHECK OPTION do? Why is this important?**
- prevents modifications through the view that conflict with the view’s filter. 
- Important because if you don't the filter develops conflict and you miss data. 

**9. In a view, what does SCHEMABINDING do? Why is this important?**
- binds the schema of referenced objects and columns to the schema of the referencing object.
- Indicates the referenced objects cannot be dropped and columns cannot be altered or dropped.
- Avoids dropping tables or altering columns that are critical for data pulls. 

**10. What is a table valued function?**
- reusable table expressions that support input parameters. 
- Named block of code that returns a table value.

**11. What does the APPLY operator do?**
- It joins tables, but instead of evaluating them as a set (aka join) it evaluates the left first, then the right (which allow right to reference the left)

**12. What are the two forms of the APPLY operator? Give an example of each.**
- Cross Apply and Outer Apply; 


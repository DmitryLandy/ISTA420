## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 8a HW
## DATE: 2/15/2021
---
**1. When using INSERT, is the list of columns necessary? Why or why not?**

- its optional but if you do specify it, you control the column/value association instead of relying on the order of the columns in the table

**2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do you not use a subquery?**

- yes you use a subquery (which the result is inserted into the table)
- If it isn't specified the first row of the table is automatically used.
- You should always specify the subquery.

**3. What is the operand for the INSERT EXEC statement?**

- The result set returned from the stored procedure.

**4. How would you use the INSERT INTO statement?**

- same as insert values
```
INSERT INTO <table>(<column>) VALUES(<value>);
```

**5. What are the parameters to the BULK INSERT statement?**

- Table, path, options ( data file type, field terminator, row terminator)

**6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?**

- identity is only guaranteed uniqueness when a PRIMARY KEY or UNIQUE is used.

**7. How do you create a SEQUENCE object?**

- Use the CREATE SEQUENCE command. 
- Required: Sequence name
- Optional: data type, min value, max value, cycle, 

**8. How do you use a SEQUENCE object?**

- invoke NEXT VALUE FOR <sequence name>

**9. How do you alter a SEQUENCE object?**

- ALTER SEQUENCE <sequence name>

**10. What is the difference between DELETE and TRUNCATE?**

- DELETE: delete data from a table based on an optional predicate
- TRUNCATE: delete all rows from a table with no options

**11. What is the difference between DELETE and DROP TABLE?**

- DROP TABLE: deletes the whole table.



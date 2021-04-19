## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 11b HW
## DATE: 4/13/2021
---

**1. What is dynamic SQL?**
- Ability to create T-SQL Batches and then execute them

**2. In executing dynamic SQL, what are the differences between using the EXEC command and the sp executesp stored procedure?**
- EXEC Command requires a character string to execute
- sp executesp supports input parameters

**3. What is a SQL injection attack? Give an example of an attack.**
- Putting SQL code on the user side to return data from the database

**4. How do you execute the EXEC command? Write a complete example using the TSQLV4 database.**
```
DECLARE @sql AS VARCHAR(100);
SET @sql = 'PRINT ''This message was printed by a dynamic SQL batch.'';';
EXEC(@sql);
```

**5. Describe the use of input parameters and output parameters for the sp executesql stored procedure.**
- 2 input parameters and an assignment section
- @stmt, @params

**6. What are the three kinds of routines that T-SQL recognizes?**
- user defined functions
- stored procedures
- triggers

**7. What is the difference between a stored procedure, a user defined function, and a trigger?**
- user defined functions: function that calculates something
- Stored procedures:  encapsulated code with input and output parameters that result in a set of queries
- Trigger: Special stored procedure that is executed implicetly (when it's triggerd)

**8. What is the primary function of a UDF? This is not specifically stated in the book but is clear from the context of the discussion n the book.**
- A query that returns different information based on values. input from user and transform it to output

**9. (Not in book.) What are side effects, and why are they dangerous?**
- When a function changes things outside of its expected scope.

**10. What is the principle distinction between a UDF and a stored procedure?**
- UDF can be used in the FROM clause, SP can'table

**11. Given that you cannot execute a trigger explicitly, what is the advantage of using triggers?**
- They execute when a certain even occurs automatically

**12. In using error handling in T-SQL, can you mimic a finally block? If so, how?**
- IF Else within the catch block

**13. Write a user defined function that returns a Booleans as to whether a customer may purchase alcohol as of the instant that the function runs.**
- 
**14. Write a trigger that places a customer in the OFF LIMITS table if he attempt to purchase alcohol when he is underage.**
- 
**15. Write a stored procedure that deletes customers from the OFF LIMITS table when they have reached their 21st birthday.**

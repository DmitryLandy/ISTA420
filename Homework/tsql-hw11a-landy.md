## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 11a HW
## DATE: 4/7/2021
---
**1. Why do we use variables in T-SQL? How do you declare and initialize T-SQL variables? Can you declare and initialize a variable in a single step?**
- temporarily store data to be called
- Declare @varName as Int; Set @varName = 10;
- Declare @i as int =10;

**2. Why is the assignment SET method for setting a variable safer than the assignment SELECT method?**
- Select can query mutliple values and can be unpredictable when querying multiple rows
- Set queries only one value.

**3. Describe what is meant by a batch file in T-SQL? What is the difference between batches and transactions?**
- one or more statements meant to execute as a single unit
- Transactions are atomic, batches can have multiple transactions.

**4. Can a transaction be split between multiple batches? Can a batch be split between multiple transactions? Explain.**
- Yes
- no because they are parsed and executed as a single unit.

**5. What is meant when the book says that “a batch is a unit of resolution?” Explain binding.**
- It is resolved (checked) as a whole for the batch (not the individual parts of the batch)

**6. What is the scope of variables with respect to T-SQL batches?**
- Just within the batch

**7. Give a practical example of the use of the GO n operator that is not in the book.**
- SELECT * from thisTable; go 10

**8. How to you delimit if ...else constructions that contain multiple statements?**
- using BEGIN and END

**9. Does T-SQL provide a SWITCH ...CASE type of construct? See chapter 2 if you don’t recall. If it exists, is it interchangeable with the if ...else construct?**
- select When X then Y
- its interchangeable with if/else

**10. What is the difference between a relation and a cursor?**
- Cursors are non-relational
- relations have to be a set

**11. What are the specific steps to use a cursor? List the steps.**
- declare cursor based on a query
- open the cursor
- fetch attribute values from the first cursor record into variables
- while not at end, loop through
- close cursor
- deallocate cursor

**12. What is the scope of a local temporary table?**
- just to the session, in the creating level and all inner levels of the call stack

**13. When are global temporary tables destroyed? What is the main difference between local temporary tables and global temporary tables?**
- Visible to all other sessions
- destroyed automatically when the session disconnects

**14. Under what conditions would you use a table variable instead of a local temporary table? Why would you prefer to use a local temporary table instead of a table variable?**
- They only limited ot the current batch. 
- Depends on the scope you need

**15. What is a table type? What is the syntax for creating a table type? Whhat is the syntax for using a table type?**

- Creates a table definition (like an interface)
- Similar to a table but state "Create Type"
- Declare @tablename as table definition
## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 9 HW
## DATE: 3/24/2021
---
**1. What is a temporal table?**
- A built-in function that allows you to restore an older state of rows 

**2. Under what circumstances would you use a temporal table? Temporal tables are in widespread use in certain kinds of businesses.**
- Accidental deletion, updates
- Whenever you need to look at the status of an account in the past.

**3. What are the semantics of a temporal table? There are seven of them.**
- primary key
- two columns as DATETIME2 
- Start Column
- End Column
- designation for period columns
- SYSTEM_VERSIONING is on
- Linked History table

**4. How do you search a history table?**
- Explicitly mention the columns if they are hidden

**5. How do you modify a history table?**
- You don't modify history table directly

**6. How do you delete data from a history table? Why would you want to delete data from a history table?**
- You don't delete from a history table

**7. How do you search a history table?**
- specifying the columns explicitly if they are hidden
- query the current table

**8. How do you query all data from both a history file and the current data?**
- specify the columns and then the tables to query from

**9. How do you drop a temporal table?**
- turn system versioning off
- drop table <name of table>
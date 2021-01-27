## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 2c HW
## DATE: 1/24/2021
---
1. **List the date/time types in T-SQL.**
	
	- DATETIME
	- SMALLDATETIME
	- DATE
	- TIME
	- DATETIME2
	- DATETIMEOFFSET

2. **How do you express a date/time literal in T-SQL?**

	- 'YYYYMMDD'
	- Example: WHERE orderdate = CAST('20160212' AS DATE);

3. **What is the setting DATEFORMAT used for?**

	- How SQL interprets the literals used for converting to date and time types

4. **Write a T-SQL snippet changing the date format to German. Read the documentation on how to do this.**

	- SET LANGUAGE German;

5. **What is the difference between CAST(), CONVERT(), and PARSE()?**

	- CONVERT() explicitly convert character-string literal to requested data type (T-SQL)
	- CAST() same as convert but compatible with other languages.
	- PARSE() convert the datetime string to another datatype with the culture (different syntax).

6. **What function returns the current date? This is very useful in a table that maintains a log of events, such as user logins.**

	- GETDATE, CURRENT_TIMESTAMP, GETUTCDATE, SYSDATETIME, SYSUTCDATETIME, and SYSDATETIMEOFFSET.

7. **How do you add one day to the current date? Add one week? Add one month? Add one year?**
	
	- DATEADD()
	- SELECT DATEADD(year, 1, '20160212');
	
8. **Write a SQL snippet to return the number of years between your birth date and today’s date.**

	- select DATEDIFF(year, '19970620', '20210124');
	
9. **How do you check a string literal to see if it represents a valid date?**

	- ISDATE(*date string*);
	
10. **What does EOMONTH() do? Give an example of why this might be very useful.**
	
	- Specify last day of the month.	
	- Could be used to schedule deliveries at the end of the month
	
11. **Payments are due exactly 30 days from the date of the last function. Write a select query that calculates the date of the next payment. Pretend we want to update a column in a database that contains the date of the next payment. We will do this when we write UPDATE queries.**

	- select CAST((DATEADD(day, 30, lastFunctionDate)) as DATE)

12. **Suppose your son or daughter wants to run a query every day that tells them the number of days until their 16th birthday. Write a select query that does this.**

	- DATEDIFF(SYSDATETIME(), dateof16bday);

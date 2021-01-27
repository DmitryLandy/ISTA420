## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 2b HW
## DATE: 1/19/2021
---

1. **What is a data type? Why do we have data types?**

	- Data types are used to specify the type of information that is stored. Used represent stored information.
	
2. **What is a collation? Name four elements of a collation.**

	- Collation is a SQL Server setting that provides rules for configuring properties of the data. 
	
	- case sensitivity, accent sensitivity, language support, sort order
	
3. **How would you strip whitespace from a string? For example, suppose you had “ Dave ” but wanted only “Dave”.**

	- ```trim, rtrim``` and ```ltrim``` remove the leading or trailing spaces
	
4. **Suppose you wanted to make a list of every college and university that was called an Institute from the college table. Write the query.**

	- ```select * from college where college.Name like '%Institute%';```

5. **How would you find the number of the index of the first space in a string? For example, the index of the first space in “Barack Hussein Obama” would be 7.**

	- Use PATINDEX or CHARINDEX. 
	- ```Select patindex('% %', 'Barack Hussein Obama'); ```
	- ```select charindex(' ', 'Barack Hussein Obama');```

6. **How would you select just the first name in a list of the presidents. Each record looks like the: ”George Washington”, ”John Adams”, ”Thomas Jefferson”. First names can be an arbitrary length, from “Cal” to “Benjamin.” (e.g., Cal College, Benjamin Harrison)**

	- ```select substring(presidents.name, 1, charindex(' ', presidents.name) -1) as Firstname from presidents;```
	

7. **What is the order of precedence for the logical operators?**
	
	1. NOT

	1. AND

	1. BETWEEN, IN, LIKE, OR
	
8. **What is the order of precedence for the math operators?**

	1. * (Multiplication), / (Division), % (Modulo)

	1.  + (Addition), – (Subtraction)

9. **What is the difference between a simple and a searched CASE expression?;**

	- SIMPLE: uses one value to compare with a list of possible values and returns a value for the first match. Based on a literal value
	
	- SEARCHES: uses the ```when``` clause to be more specific with the expression

10. **How would you turn a list of names like this: “LASTNAME, FIRSTNAME”, to a list like this: “FIRSTNAME LASTNAME”?**
	- ``` select concat(right(name, ",")+2)+" "+left(name, ",") from names as newName;```

11. **How would you turn a list of names like this: “FIRSTNAME LASTNAME”, to a list like this: “LASTNAME, FIRSTNAME”?**
	- ```select concat(right(name, " ")+2)+", "+left(name, " ") from names as newName;```

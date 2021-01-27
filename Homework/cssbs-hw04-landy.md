## Name: Dmitry Landy
## File: Cssbs-hw03-landy.md
## Date: January 21, 2021
---

1. **What are all possible values of Boolean expression?**

	- true or false

2. **List the equality operators. List the relational operators. List the logical operators. How are they the same? How are they different?**

	- Equality: ==, !=
	- Relational: <, <=, >, >=
	- logical: && (AND), || (OR)
	- All are used to compare value within an expression
	- They differ in how they compare the values and what they check for
	
3. **What is the general concept of short circuiting? This question has a short and simple answer and you do not need to have a detailed response.**

	- As soon as the expression cant be true for the logical operator, it short circuits

4. **What are the difference in how short circuiting works for && and ||?**

	- && short-circuits at the first false
	- || short-circuits after all values are evaluated
	
5. **Look at the list of operators. What operator has the highest precedence? Which has the lowest?**

	- () is the highest
	- = is the lowest

6. **In an if or else construction using multiple lines of code, what effect does the use of curly braces have?**

	- It provides the scope for the if-else statement (aka "falls through")
	
7. **In a switch statement, what happens if you omit break?**

	- It evaluates the statements in the next case
	
8. **The four keywords in a switch statement are switch, case, break, and default. Explain what each keyword does.**

	- switch: keyword for initiating a switch statement.
	- case: label to compare the expressions.
	- break: keyword to escape the scope of the switch statement and return control to the outside code
	- default: automatic statement to execute if all cases are false

9. **Look at the source listing below. It contains two methods: recurr1() and recurr2(). There is a significant difference between the two methods. What is it?**

	- recurr2() has two parameters while recurr1 has 1 parameter.
	- recurr1() uses traditional recurssion, while recurr2 uses tail recurssion

10. **(Not in book) What is a recursive method? Using a language you know (such as English), write a recursive method that adds up the integers in a list of integers. The input to the method is a list of integers and the output is a scalar value representing a sum.**

	- A method that calls itself within its body
	
	- Start at the top of the list. Add the value of the number below to the value above. Return the sum

11. **(Not in book) Read a short summary of De Morgan’s laws.**

	1. *Explain how this statement, ”It’s not snowing or raining,” is the same as this statement, ”It’s not snowing and it’s not raining.”*
		- (weather != (snowing || raining)) = (weather != snowing && weather != raining)
		
	1. *Explain how this statement, ”I’m not running and walking,” is the same as this statement, ”I’m not running or I’m not walking.”*
		- (state != running && walking) = (state != running or state != walking)
		

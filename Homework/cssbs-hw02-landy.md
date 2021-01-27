#### NAME: Dmitry Landy 
#### ASSIGNMENT: C# Chapter 2 Homework 
#### DATE: 1/13/2020

**1. What is a local variable?**
- A variable within a small seciton of code, such as a method

**2. What is a statement?**
- A command that result in an action performed
- An expression is something the resolves to a value

**3. What is an identifier?**
- Names used to identify elements within the program

**4. What is a keyword?**
- Identifiers within the language that can't be used as identifiers because they are reserved

**5. What is a variable?**
- A storage location for a value

**6. How do you declare a variable? How do you assign a value to a variable? Can you have a variable that does not have a value? Can you declare and initialize a variable in a single statement?**

- A variable is declared with the type and name(identifier)
- The assignment operator (=) is used to assign a value to the variable
- A variable must be explicitly assigned to use it, but it can be created without assignment
- You can declare and initialize a variable in the same statement.

**7. What does Visual Studio do when you open a project (a .csproj file) without opening the solution (a .sln file)? Why might this be a problem?**
- A new solution file (.sln) is created. This can create multiple solution files for the same project.

**8. How are arithmetic operators and variable types related?**
- Arithmetic operators can be used with variables to change the value of the variable, depending on the value's type.

**9. How do you turn an integer into a string?**
- Use of the ```toString()``` method

**10. How do you turn a string into an integer?**
- ```System.int32.parse()``` method 

**11. What is the difference between precedence and associativity? Give an example where this makes a difference.**
-precedence can result in different order of execution that has a different outcome 
-Associativity is the direction order used to evaluate expressions
- (3-1)*5

**12. What is the definite assignment rule?**
- Before a variable can be used, it has to be initialized

**13. How are the prefix and postfix increment and decrement operators evaluated differently?**
- Prefix operators are evaluated immidiately
- Postfix operators are evaluated afterwards.

**14. What is string interpolation?**
-Syntax used to include variables and expressions (which are evaluated) in strings instead of concatinating them together. 

**15. What does the var keyword do?**
- it is a variable that interprets the value type. It is an implicit type.

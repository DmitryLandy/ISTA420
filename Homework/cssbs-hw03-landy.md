## Name: Dmitry Landy
## File: Cssbs-hw03-landy.txt
## Date: January 20, 2021
---
1. **What is a method?**

	- named block of code that optionally accepts input and returns outut.
	- sets of discrete code that are designed to perform a specific task or calculation. Identified by ()

1. **What is the difference between a function and a procedure/subprocedure/subroutine?**

	- **Function**: named block of code that returns a value. It calculates something from a given input
	- **Procedure/subprocedure/subroutine**:  sets of commands that execute in order. Each command is a sort of statement.
	
1. **What does a return statement do?**

	- specifies the value that the method returns
	- passes information out of an expression.
	
1. **What is an expression-bodied method?**

	- A simpler way to write a method, but only in a single expression.
	- EXAMPLE: ```int addValues(int leftHandSide, int rightHandSide) => leftHandSide + rightHandSide;```

1. **What is the scope of a variable?**

	- The boundaries that a variable is useable in.
	
1. **What is a field?**
	
	- A variable declared directly within a class or struct

1. **What is an overloaded method?**
	
	- More than one method with the same name. 
	- Different version of a method that take different parameters.
	- It is used for Polymorphism

1. **How do you call a method that requires arguments?**
	
	- Input the appropriate arguments that satisfy the parameters of the method. Use () parameter list

1. **How do you write a method, that is, specify the method definition, that requires a parameter list?**

	- [return type] [method name] ([parameter list]){ body of the method }

1. **How do you specify a parameter as optional when defining a method?**
	
	- Provide default values for the parameter using the assignment operator;
	
1. **How do you pass a argument to a method as a named parameter?**

	- specify the parameter name followed by a colon and the value to use it
	
1. **How do you return values from a method? Can you return multiple values from a method, and if so, how?**

	- writing the return statement inside the method body
	- write a return statement that returns a tuple.

1. **What is a tuple? How do you define a method that returns multiple values? Give an example of a method that returns multiple values other than the example in the book.**

	- small collection of data. 
	- return type has multiple return types within parenthesis (int, int) name (par 1){}
	
1. **Examine the method definition on page 83 of the book. Desk check the execution of this method. What do you discover? This is called recursion.**

	- calling a method within the same method results in the method executing multiple times with different value for the parameter

1. **How does the compiler resolve an ambiguity between named arguments and optional parameters?**

	- Different parameter list
	
1. **The book states: “A key feature of C# and other languages designed for the .NET Framework is the ability to interoperate with applications and components written with other technologies.” What is the COM and how is the CLR dependent on the COM?**

	- COM: Component Object Model (creates binary software components that interact)
	- CLR: Common Language Runtime uss the components of the .NET framework that are provided by COM

Name: Dmitry Landy
Assignment: T-SQL HW01
Date: 1/11/2020

1. How does the book describe the difference between imperative and declarative languages?

Declaritive: specify what to get 
Imperative: specify how to get something

2. List three categories of command statements in SQL.

Data Definition Language (DDL)
Data Manipulation Language (DML)
Data Control Language (DCL)

3. Give an informal deffinition of database as used in the expression "relational database management system." 
Give an informal deffinition of database as used in the expression "Human Resources database."

- A RDBMS database focuses on increasing effeciency, fullness of data, and reducing redundancy
- A human resources database is simple database used to store information without focus on reducing redundancy and increasing effeciency.

4. The book states that, "the goal of the relational model is to enable consistent representation of
data with minimal or no redundancy and without sacrificing completeness. . . " Briefly state your
understanding of minimal or no redundancy and completeness. Why do you think that these values
are important?

- Redundancy costs memory and efficiency. On the other side, being incomplete with data results in a lack of accuracy of that data.

5. What is the difference between two-valued logic, three-valued logic, and four-valued logic? How does
SQL implement three-valued predicate logic?

-This determines the number of predicates (e.g. two-valued logic is either true or false). SQL adds "null" (aka missing) as the third value.

6. How does SQL enforce entity integrity? What is entity integrity?

-Candidate keys provide entity integrity, which is the ensurance that a tuple or row doesn't have repeating objects.

7. How does SQL enforce referential integrity? What is referential integrity?

-Foreign keys enforce referential integrity, which makes sure that the reference to a candidate key is valid. References to objects via foreign key must exist. Avoid anomalies.

8. What is a relation as defined in the textbook? A one word answer to this question is sufficient.

-A set of values.

9. Relational databases are based on three mathematical concepts: set theory, predicate logic, and rela-
tional algebra.
(a) Please give your brief understanding of set theory as described in the text. What is a set?

-Collection of data should be organized in rows and columns , with no defined order, filled with distinct items or objects.

(b) Please give your brief understanding of predicate logic as described in the text. What is predicate
logic?

-Predicate logic is the theory that arguments will carry out based on the evaulation of the predicate (true or false).

(c) Please give your brief understanding of relational algebra. What is selection? What is projection?
This is not in the book.

-Relational algebra is a small set of operations such as seleciton and projection. Selection are based on rows and projection is based on columns.

10. Is this table in first normal form? Why or why not? If it is not, how would you change it?

create table faculty (
facID int primary key,
facName text,
facCreds text);

facID 	facName 			facCreds
1 		Alan Alda 			BA, MA
2 		Bridgette Bardot 	BS, MS, PhD
3 		Casey Cason 		AA, BBA, MBA, DEd

This is not in 1NF because the facCreds has multiple values in there. To fix this:

faculty table
	facid int
	facname text
	
credential table
	credid int
	credname text
	
fac_cred table	
	facid int
	credid int
	


11. Is this table in second normal form? Why or why not? If it is not, how would you change it?

create table pets (
ownerID int primary key,
petID int primary key,
ownerFirstName text,
ownerLastName text,
petName text,
petType text);

ownerID petID ownerFirstName ownerLastName petName petType
1 		1 		Dom 		Delouise 		Rex 	German Shepherd
1 		2 		Dom 		Delouise 		Lacy 	Border Collie
2 		3 		Emilio 		Estevez 		Midnight Persian Cat

This is not in 2NF because the composite keys are not separated. This should split into three tables: one with pet id and owner id, then pet id, name, type, then owner id and name.

12. Is this table in third normal form? Why or why not? If it is not, how would you change it?

create table friends (
friendID int primary key,
friendName text,
friendStreet text,
friendCity text,
friendState text,
friendZip text);

ID FirstName 	LastName 	Street 				City 		State 	Zip
1 Fred 			Flintstone 	123 Rock Quarry Rd 	Bedrock 	GA 		31905
2 Greta 		Garbo 		456 Starlit Ave 	Paris 		FL 		30019
3 Harry 		Houdini 	789 Hidden Glen Lane Alcatraz 	CA 		00000

This is not in 3NF because city is transitively dependant on Zip. To fix this: ID, firstName, and LastName street, and foreign key for zip are in a table, zip, city and state are in another.

13. List the components of a four-part object name.

server, database, schema, object

14. What is the difference between declarative data integrity and procedural data integrity?

-Declaritive data integrity is enforced by the relational model, whereas procedural data integrity is enforced with code (e.g. triggers). 




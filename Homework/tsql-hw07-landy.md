## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 7 HW
## DATE: 2/7/2021
---
**1. What is a window function?**

- For each row, a scalar result is based on calculations against a subset of rows from the underlying query

- Takes a subset of all rows as input and transforms it into a single value for each row of the data set.

**2. What does PARTITION do?**

- Restrict the window to the subset of rows that have the same values in partitioning columns as in the current row.

**3. What does ORDER BY do?**

- Defines the ordering of the partition

**4. What does ROWS BETWEEN do?**

- Filters a frame (or subset) of rows from the window partion between two specified delimiters.

- A sliding frame (which is based on delimiters) will have values filtered from it as the frame moves throughout the total set.

**5. What is a ranking window function? Why would you use it? Give an example.**

- Rank each row with respect to other rows in the window.
- Four Ranking Functions: 
	- ROW_NUMBER
	- Rank
	- DENSE
	- NTIILE

**6. What is an offset window function? Why would you use it? Give an example.**

- Returns an element from a row that is at a certain offset from the current row/ the beginning/end

**7. What do LEAD and LAG DO**

- Support windwos partitions and window order clauses
- Lag looks before the current row and returns previous row results
- Lead looks ahead and returns future row results

**8. What do FIRST VALUE and LAST VALUE do?**

- Returns an element from the first and last rows of the window frame 

**9. What is an aggragate window function? Why would you use it? Give an example.**

- Aggregate rows in the defined window. 
- Support window-partion, window-order, window-frame clauses

**10. What is a pivot table and what does it do?**

- rotates data from a state of rows to a state of columns, possibly aggregating values in the process.

**11. In mathematical theory, what is a power set? How does this definition of power set relate to grouping sets?**

- product of all sets possible within a set
- Cube clause produces a power set

**12. What is a bit array? How can you implement a bit array to represent a set of flags? How does the GROUPING ID() function implement a bit array?**

- An array of bits. 
- Yes, 1D array of 1 and 0, with 1 being a flag.


**13. Read the documentation on the UNIX/Linux chmod command. How would interpret this command: chmod 755 myscript.sql?**

- Change modification permissions to rwx for users, r-x for groups, r-x for others.

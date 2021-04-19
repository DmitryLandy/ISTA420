## NAME: Dmitry Landy
## ASSIGNMENT: Chapter 10 HW
## DATE: 3/31/2021
---
**1. What is the purpose of transactions? Why do we use transactions in SQL scripts?**
- a unit of work that includes multiple activities.
- Allows multiple activities to be committed at the same time

**2. Briefly describe each of the ACID properties.**
- Atomic: all changes go through or none
- Consistent: access to concurrent data as it is modified
- Isolated: transactions access only consistent data. 
- Durable: Data changes are always written to the database’s transaction log

**3. What do we mean when we talk about the granularity of locks?**
- How access to transaction properties are controlled.
- size of data being acted on.

**4. What do we mean when we talk about the modes of locks?**
- Exclusive or shared locks
- These determines how long the lock is there and who has access to it.

**5. In your ownh words, describe blocking, and give an example.**
- Preventing data resources from being accessed by incompatible locks. 

**6. What are the properties of locks? That is, list the column name and column type of the fields in sys.dm tran locks.**
- request session id
- resource type
- resource database id
- db name
- resource description
- resource associated entity id
- request modes
- request status

**7. What are the properties of sessions? That is, list the column name and column type of the fields in sys.dm exec connections.**
- session id
- connect time
- last read
- last write
- most recent sql handle

**8. What are the requests of sessions? That is, list the column name and column type of the fields in sys.dm exec requests.**
- session id
- blocking session id
- command
- sql handle
- database id
- wait type
- wait time
- wait resource

**9. What is an isolation level? Give an example of the operation of an isolation level.**
- Determine levels of consistency you get with data
- Set Transaction Isolation Level <isolation Name>;

**10. (Not in the book.) What do we mean when we say that an object is serializable?**
- it can be listed in an ordered way via bits

**11. What is an deadlock? Give an example of a deadlock?**
-two or more sessions block each other
- A blocks B, B blocks C, C blocks A
/*
Create table If Not Exists Employee3 (id int, name varchar(255), salary int, managerId int);
#Truncate table Employee
insert into Employee3 values (1, 'Joe', 70000, 3);
insert into Employee3 values (2, 'Henry', 80000, 4);
insert into Employee3 values (3, 'Sam', 60000, null);
insert into Employee3 values (4, 'Max', 90000, null);
#insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None')

*/
/*
Input: 
Employee table:
+----+-----------+--------+-------------------+
| id | name   | salary | managerId |
+----+-----------+--------+-------------------+
| 1  | Joe      | 70000  | 3                |
| 2  | Henry  | 80000  | 4                |
| 3  | Sam    | 60000  | Null           |
| 4  | Max    | 90000  | Null           |
+----+----------+-----------+----------------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
*/
SELECT 
	e.name AS Employee
FROM Employee3 AS e
INNER JOIN Employee3 as m
ON e.managerid = m.id
WHERE e.salary > m.salary;

/*other way*/
SELECT E1.NAME as Employee 
from Employee3 as E1
inner join Employee3 as E2
WHERE E1.managerid = E2.id
AND E1.SALARY > E2.SALARY

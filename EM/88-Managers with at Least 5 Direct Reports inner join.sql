#Managers with at Least 5 Direct Reports
/*
Create table If Not Exists Employee2 (id int, name varchar(255), department varchar(255), managerId int);
Truncate table Employe2;
insert into Employee2 values (101, 'John', 'A', null);
insert into Employee2 values (102, 'Dan', 'A', 101);
insert into Employee2  values (103, 'James', 'A', 101);
insert into Employee2 values (104, 'Amy', 'A', 101);
insert into Employee2  values (105, 'Anne', 'A', 101);
insert into Employee2  values (106, 'Ron', 'B', 101);
#insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');
*/
/*
Example 1:

Input: 
Employee table:
+-----+-------------+--------------------+-----------------+
| id  | name      | department | managerId |
+-----+-------------+--------------------+-----------------+
| 101 | John    | A                    | None          |
| 102 | Dan      | A                    | 101            |
| 103 | James | A                    | 101            |
| 104 | Amy     | A                    | 101            |
| 105 | Anne    | A                    | 101            |
| 106 | Ron      | B                    | 101            |
+-----+-------------+-------------------+-----------------+
Output: 
+------+
| name |
+------+
| John |
*/
#Write an SQL query to report the managers with at least five direct reports.
SELECT 
	m.name 
FROM Employee2 e
INNER JOIN Employee2 AS m
	ON e.managerid = m.id
GROUP BY e.managerid
HAVING COUNT(e.id) >=5

/*
Create table If Not Exists Employees4 (employee_id int, name varchar(20), manager_id int, salary int);
#Truncate table Employees;
insert into Employees4  values (3, 'Mila', 9, 60301);
insert into Employees4  values (12, 'Antonella', null, 31000);
insert into Employees4  values (13, 'Emery', null, 67084);
insert into Employees4  values (1, 'Kalel', 11, 21241);
insert into Employees4  values (9, 'Mikaela', null, 50937);
insert into Employees4  values (11, 'Joziah', 6, 28485);
#insert into Employees4 (employee_id, name, manager_id, salary) values ('11', 'Joziah', '6', '28485')
*/
/*
Example 1:

Input:  
Employees table:
+--------------------+-------------------+-------------------+----------+
| employee_id | name            | manager_id | salary |
+--------------------+-------------------+--------------------+----------+
| 3                    | Mila              | 9                    | 60301  |
| 12                  | Antonella    | null                | 31000  |
| 13                  | Emery         | null                 | 67084  |
| 1                    | Kalel           | 11                   | 21241  |
| 9                    | Mikaela      | null                 | 50937  |
| 11                 | Joziah         | 6                     | 28485  |
+-------------------+-----------------+----------------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

Explanation: 
The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
Kalel's manager is employee 11, who is still in the company (Joziah).
Joziah's manager is employee 6, who left the company because there is no row for employee 6 as it was deleted
*/
/*
Write an SQL query to report the IDs of the employees whose salary is strictly less 
than $30000 and whose manager left the company. 

*/
WITH filtered_emp AS (
select 
	employee_id,
	name,
	manager_id,
	salary 
from Employees4 WHERE salary < 30000 AND manager_id IS NOT NULL
)
SELECT 
	e.employee_id
FROM filtered_emp AS e
	LEFT JOIN Employees4 AS m
    ON e.manager_id = m.employee_id
WHERE m.employee_id IS NULL
ORDER BY e.employee_id;

/*optimized approach*/
select 
	employee_id,
	name,
	manager_id,
	salary 
from Employees4 WHERE salary < 30000 AND manager_id IS NOT NULL
AND manager_id NOT IN (SELECT employee_id FROM Employees4)
ORDER BY employee_id



USE IT;
CREATE Table Employee
(
EmpID INT,
EmpName Varchar(30),
Salary Float,
DeptID INT
);

INSERT INTO Employee VALUES(1001,'Mark',60000,2);
INSERT INTO Employee VALUES(1002,'Antony',40000,2);
INSERT INTO Employee VALUES(1003,'Andrew',15000,1);
INSERT INTO Employee VALUES(1004,'Peter',35000,1);
INSERT INTO Employee VALUES(1005,'John',55000,1);
INSERT INTO Employee VALUES(1006,'Albert',25000,3);
INSERT INTO Employee VALUES(1007,'Donald',35000,3);


SELECT * FROM Employee;
#with join
SELECT a.empname,a.deptid,b.Avg_salary,a.salary from
(SELECT empid,empname,deptid,salary FROM Employee) A
INNER JOIN
(SELECT deptid,AVG(salary) AS Avg_salary FROM Employee GROUP BY deptid) B
ON A.deptid = B.deptid
WHERE A.salary > B.Avg_salary;

#using subquery
SELECT E1.empname,E1.deptid,e1.salary from Employee AS E1
WHERE salary >
(
SELECT AVG(salary) as Avg_Salary  FROM Employee AS E2
WHERE E1.deptid = e2.deptid );

#with cte
WITH CTE AS (
	SELECT *, AVG(Salary) OVER (PARTITION BY DeptID) as Dept_avg
	FROM Employee
) Select EmpID, EmpName, Salary
FROM CTE
WHERE Salary > Dept_avg;


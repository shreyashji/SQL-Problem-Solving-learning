#Difference between Row Number, Rank and Dense Rank | Tie-breaking scenario
#CREATE TABLE Employees
  (EmployeeID smallint NOT NULL,
  Name varchar(50) NOT NULL,
  DeptID int NULL,
  Salary integer NULL
  );

#Insert data

#INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(1,'Mia',5,50000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(2,'Adam',2,50000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(3,'Sean',5,60000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(4,'Robert',2,50000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(5,'Jack',2,45000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(6,'Neo',5,60000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(7,'Jennifer',2,55000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(8,'Lisa',2,85000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(9,'Martin',2,35000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(10,'Terry',5,90000);
 # INSERT INTO Employees(EmployeeID,Name,DeptID,Salary) VALUES(12,'David',5,60000);

— RowNumber, Rank and Dense_Rank

  Select EmployeeID, Name, DeptID, Salary ,
  Row_Number() OVER (PARTITION BY DEPTID ORDER BY SALARY) AS RoowNumber
  ,RANK() OVER (PARTITION BY DEPTID ORDER BY SALARY) AS RANK2
  ,DENSE_RANK() OVER (PARTITION BY DEPTID ORDER BY SALARY) AS densee_RANK
  FROM EMPLOYEEs;
  
  #in rank if two duplicates are there then 1 rank assign to both record and after that it will skip the next rank
  #dense rank sequential rank genrated,if two duplicates are there then 1 rank assign 
  #if dont people with same rank assign to duplicate, then  we need to do sorting on another column
    Select EmployeeID, Name, DeptID, Salary ,
  Row_Number() OVER (PARTITION BY DEPTID ORDER BY SALARY) AS RoowNumber
  ,RANK() OVER (PARTITION BY DEPTID ORDER BY SALARY,EmployeeID) AS RANK2
  ,DENSE_RANK() OVER (PARTITION BY DEPTID ORDER BY SALARY,EmployeeID) AS densee_RANK
  FROM EMPLOYEEs;
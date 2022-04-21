select * from empt;
select * from dept;

#find duplicate records in a table
SELECT emp_name,salary, COUNT(*) AS CNT  
    FROM empt  
    GROUP BY emp_name,salary 
    HAVING COUNT(*)>1 ;
#-- delete all the duplicate records in a table   
WITH cte AS (
    SELECT 
        emp_name,salary,
        ROW_NUMBER() OVER (
            PARTITION BY 
               emp_name,salary
            ORDER BY 
               emp_name,salary
        ) row_num
     FROM 
        empt
)
DELETE FROM cte WHERE row_num > 1;

# find the manager name for the employee 
 #   --where empid and managerid are on the same table
SELECT e.emp_id, e.emp_name, m.emp_name 
    FROM empt e
    LEFT JOIN empt m 
        on e.Manager_Id = m.Emp_Id;
        
# find the second highest salary
Select max(Salary) as Salary
    FROM empt
    WHERE Salary <(Select max(Salary) from empt) ;
 -- 1. Inner Query - Get the highest salary
 -- 2. Outer Query - Get the highest salary excluding the highest salary 
                    -- gives the second highest salary

-- find the employee with the second highest salary
SELECT * FROM empt where Salary in 
(SELECT max(Salary) as Salary
    FROM empt
    WHERE Salary < (Select max(Salary) FROM empt)  );
    
-- 3rd and Nth highest salary
SELECT MIN(Salary) FROM				-- OUTER QUERY 
( SELECT DISTINCT TOP 3 Salary		-- INNER QUERY
	FROM empt
	ORDER BY Salary DESC
)  AS O
-- Here 3 can be changed to N ; can be applied for any number. 
-- 1. Inner Query - Get the highest 3 salaries
-- 2. Outer Query - Get the minimum salary from those salaries

-- query to find maximum salary from each department
SELECT Department_Id, MAX(Salary) as Salary 
    FROM empt 
    GROUP BY Department_Id  
    
#--alternative for TOP clause in SQL
SELECT TOP 3 * FROM empt
#Alternative
SET ROWCOUNT 3  
Select * from empt
SET ROWCOUNT 0 

-- showing single row from a table twice in the results
SELECT dep_name FROM dept d WHERE d.dep_name='IT'  
UNION ALL
SELECT dep_name FROM dept d WHERE d.dep_name='IT'  

-- find departments that have less than 3 employees
SELECT e.department_id,d.dep_name 
    FROM  empt e
    JOIN dept d on e.department_id = d.dep_id
    GROUP BY e.department_id,d.dep_name HAVING COUNT(Emp_Id) < 3
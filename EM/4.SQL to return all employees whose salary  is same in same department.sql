use em;
CREATE TABLE emp_salary
(
    emp_id INTEGER  NOT NULL,
    name VARCHAR(20)  NOT NULL,
    salary VARCHAR(30),
    dept_id INTEGER
);
#drop table emp_salary

INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');

SELECT * FROM emp_salary;

	SELECT Dept_id,Salary FROM emp_salary
	GROUP BY Dept_id,Salary HAVING Count(1)=1
	ORDER BY Dept_id;
    #dont need op of above query so left join & where condition

#WRITE A SQL query to return all employees whose salary  is same in same department

WITH recursive cte_sal_dep as (
	SELECT Dept_id,Salary FROM emp_salary
	GROUP BY Dept_id,Salary HAVING Count(1)=1
	ORDER BY Dept_id
)
SELECT es.* FROM emp_salary AS es
LEFT JOIN cte_sal_dep AS sd
ON es.Dept_id  = sd.Dept_id 
AND es.Salary  = sd.Salary 
WHERE sd.Dept_id is null
ORDER BY Dept_id
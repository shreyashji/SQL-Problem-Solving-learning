Create table If Not Exists Project (project_id int, employee_id int);
Create table If Not Exists Employee (employee_id int, name varchar(10), experience_years int);
Truncate table Project;
insert into Project  values (1, 1);
insert into Project  values (1, 2);
insert into Project  values (1, 3);
insert into Project  values (2, 1);
insert into Project  values (2, 4);
Truncate table Employee;
insert into Employee  values (1, 'Khaled', 3);
insert into Employee  values (2, 'Ali', 2);
insert into Employee  values (3, 'John', 1);
insert into Employee  values (4, 'Doe', 2);

SELECT * FROM Project;
SELECT * FROM Employee;

/* Write an SQL query that reports the average experience years 
of all the employees for each project, rounded to 2 digits. */
SELECT 
	P.PROJECT_ID,
	ROUND(avg(e.experience_years),2) as average_years 
    FROM Project p INNER JOIN Employee e 
		ON p.employee_id = e.employee_id
	group by P.PROJECT_ID;

/*Write an SQL query that reports all the projects that have the most employees.*/
SELECT 
	project_id,
    COUNT(DISTINCT employee_id) as employee_per_project
 FROM Project
 group by project_id;
 
 with project_stats as (
	SELECT 
		project_id,
		COUNT(DISTINCT employee_id) as employee_per_project
	 FROM Project
	 group by project_id
 ) , rank_table as (
	SELECT 
		project_id,
		DENSE_RANK() OVER(ORDER BY employee_per_project desc) AS rnk_col
	FROM project_stats
 )
 SELECT project_id FROM rank_table WHERE rnk_col=1;
 
 /* Write an SQL query that reports the most experienced employees in each project. In case of a tie, 
 report all employees with the maximum number of experience years. */
SELECT * FROM Project;
SELECT * FROM Employee;

SELECT 
	p.project_id,
    p.employee_id,
    dense_rank() over(partition by p.project_id ORDER BY E.experience_years desc) as rnk_col
FROM Project as P
INNER JOIN Employee as e
	ON p.employee_id = e.employee_id ; 

with rank_table as (
	SELECT 
		p.project_id,
		p.employee_id,
		dense_rank() over(partition by p.project_id ORDER BY E.experience_years desc) as rnk_col
	FROM Project as P
	INNER JOIN Employee as e
		ON p.employee_id = e.employee_id 
)
SELECT project_id,employee_id FROM rank_table WHERE rnk_col=1
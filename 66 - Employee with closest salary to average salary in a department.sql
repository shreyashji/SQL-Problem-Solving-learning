select * from empt;

WITH SAL_DIFF AS (

SELECT emp_name , salary , empt.department_id , Avg_Sal , (salary - Avg_Sal) as SalDiff,
RANK() OVER(PARTITION BY empt.department_id ORDER BY ABS(salary - Avg_Sal)) AS Sal_Diff
FROM empt INNER JOIN (SELECT empt.department_id,AVG(salary) as Avg_Sal from empt GROUP BY department_id) AS Avg_Sal
ON empt.department_id = Avg_Sal.department_id
)
SELECT emp_name ,salary, department_id FROM SAL_DIFF 
WHERE Sal_Diff <= 1;
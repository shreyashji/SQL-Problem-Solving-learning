/** To compute the group salary of employee
Group sal = sum of salary of all employee reporting under him including his own salary
**/
/*
https://www.linkedin.com/feed/update/urn:li:activity:6968959126907293696/?updateEntityUrn=urn%3Ali%3Afs_feedUpdate%3A%28V2%2Curn%3Ali%3Aactivity%3A6968959126907293696%29
*/
use july;
/*
create table july.emp_t(empno int,ename varchar(100), mgr  int, sal  int );
Insert into july.EMP_T (EMPNO,ENAME,MGR,SAL) values 
(7839,'KING',null,1000),
(7698,'BLAKE',7839,700),
(7782,'CLARK',7839,500),
(7566,'JONES',7839,800),
(7788,'SCOTT',7566,200),
(7902,'FORD',7566,100),
(7369,'SMITH',7902,75),
(7499,'ALLEN',7698,100),
(7521,'WARD',7698,200),
(7654,'MARTIN',7698,150),
(7844,'TURNER',7698,150),
(7876,'ADAMS',7788,50),
(7900,'JAMES',7698,100),
(7934,'MILLER',7782,300); */

SELECT * FROM july.emp_t;

WITH recursive R_EMP AS ( 
	SELECT EMPNO, ENAME, MGR , SAL,cast('/'+cast(empno as CHARACTER)+'/' as CHARACTER) as NODE FROM EMP_T WHERE MGR IS NULL
	UNION ALL
	SELECT E.EMPNO,E.ENAME,E.MGR,E.SAL , cast(R.NODE + CAST(E.EMPNO AS CHARACTER)+'/' AS CHARACTER)
	FROM
	july.emp_t E JOIN R_EMP R
	ON 
	R.EMPNO = E.MGR
)
select E.EMPNO AS EMPNO,E.ENAME AS ENAME, E.MGR AS MGR, E.SAL AS E_SAL,E.SAL+SUM(ISNULL(R.SAL,0)) AS SUM_SAL
FROM 
R_EMP E LEFT JOIN R_EMP R
ON
E.NODE <> R.NODE AND LEFT(R.NODE,LEN(E.NODE)) = E.NODE
GROUP BY E.EMPNO,E.ENAME,E.MGR,E.SAL;

#MYSQL
with recursive cte as (
	select empno as mgr, sal 
	from july.emp_t 
	where empno is null or empno in (select distinct mgr from emp_t)
	union all 
	select mgr, sum(sal) as sal
	from july.emp_t
	where mgr is not null
	group by mgr
)
select mgr, sum(sal) as group_salary
from cte
group by mgr

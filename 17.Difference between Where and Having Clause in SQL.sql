#Difference between Where and Having Clause in SQL
select * from emp where salary>10000 ;
#where clause going in each row,row by row

#whenevery we have  to apply filter on aggregated value we have to use having clause
#whose avg salary is greater than 10000
select department_id,avg(salary)
 from emp group by department_id
 having avg(salary) >9500 ;
 
#both applied ,where will be applied first and having next
select department_id,avg(salary) from emp
where salary>10000 
group by department_id
having avg(salary) >12000 ;
 


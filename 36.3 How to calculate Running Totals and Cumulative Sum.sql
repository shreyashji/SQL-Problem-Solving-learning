 #ow to calculate Running Totals and Cumulative Sum ?
 #order by shoul be on on unique column otherwise it will not work properly,duplicate record can give problem
 select *
 ,sum(salary) over(order by emp_id)
 from empm
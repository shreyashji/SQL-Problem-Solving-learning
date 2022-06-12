with recursive cte as 
(
select 
       2 AS primenbr
       union all
	   select A.primenbr+1 AS Value #recusive
	   from cte A 
       where A.primenbr<10 
)
select primenbr from cte 
group by primenbr 
having primenbr=2 or primenbr%2<>0
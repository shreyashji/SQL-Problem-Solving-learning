select * from happiness_index;



select * from 
happiness_index 
order by
case when country='India' then 3
	when country='Pakistan' then 2
    when country='Sri Lanka' then 1
else 0 end desc,Happiness_2021 desc
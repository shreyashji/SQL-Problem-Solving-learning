#Highest Energy Consumption
#Find the date with the highest total energy consumption from the Meta/Facebook
#data centers. Output the date along with the total energy consumption across all data centers.

WITH amazon_datacentre as 
(select * from fb_eu_energy
UNION
select * from fb_asia_energy
UNION
select * from fb_na_energy)
select date,tot_consumption from ( 
select date,tot_consumption,
dense_rank() over(order by tot_consumption desc) rnk from 
(select date,sum(consumption) as tot_consumption from amazon_datacentre
group by date) b1 )b2
where b2.rnk=1
order by date
;
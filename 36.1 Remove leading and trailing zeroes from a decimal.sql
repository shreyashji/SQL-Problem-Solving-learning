#float remove leading & trailing zero,take column which have decimal with precion,remove by casting as float

select * from superstore_orders;
select sales,cast(sales as float) as Amount_trailed from superstore_orders
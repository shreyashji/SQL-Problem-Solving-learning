
set @var  = 99;

select case when @var < 100 then 1
when @var > 90 then 2 
END AS VAL1

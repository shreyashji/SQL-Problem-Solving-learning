#How to find First and Last day of week

select datediff(wk,'2021-08-05',GetDate());# get 1 week differnce from this

select dateadd(wk,datediff(wk,'2021-08-01',GetDate()),'2021-08-01');
dateadd(wk,datediff(wk,'2021-08-01',GetDate()) + 1 ,'2021-08-01'); # to rrive at the last week


select datediff('2021-08-05',date)
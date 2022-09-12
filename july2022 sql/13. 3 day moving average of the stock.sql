use july;

create table july.stocks(DayNumber varchar(50),Company varchar(50),Price int);


insert into july.stocks(DayNumber,Company,Price)
values('Day 1','A',100),('Day 2','A',120),
('Day 3','A',140),('Day 4','A',100),('Day 5','A',90);


insert into july.stocks(DayNumber,Company,Price)
values('Day 1','B',200),('Day 2','B',200),
('Day 3','B',260),('Day 4','B',340),('Day 5','B',300);

SELECT * FROM july.stocks;

/*
I am back with a new #SQL concept which is usually tested in tech companies.

❓In an effort to identify variations in stock prices of companies, a person asks you to find the 3 day moving average of the stock by writing a query in SQL given the company name, day and stock price data.

Answer:

Here I used partition, window functions along with rows between clause to solve the problem.

Since we need to find the 3 day moving average we will break this into steps.

◉ First I am doing average of the price as we need that value in the query-avg(Price)

◉ Then I am doing partition by company as we want to calculate the average at a company level and also ordering by DayNumber so the order of dates does not get messed up

◉ Now I am adding the last part which is the rows between Clause which considers the current row and the 2 preceding values to compute the 3 day moving average ( rows between 2 preceding and current row)
*/

SELECT *,
AVG(price) OVER(PARTITION BY company ORDER BY DayNumber
rows between 2 preceding and current row )as  moving_average
FROM july.stocks;

#other way : unbounded means from the beggining till that point
SELECT *,
AVG(price) OVER(PARTITION BY company ORDER BY DayNumber
rows between unbounded preceding and current row )as  commulative_average
FROM july.stocks;
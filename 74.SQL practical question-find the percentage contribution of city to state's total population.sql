/* CREATE TABLE cityy (
cityname varchar(20),
citypop int ,
state varchar(20)
); */

#Get me a query to find the percentage contribution of city to state's total population
/*
INSERT INTO cityy VALUES ('Howrah',10000,'West Bengal');
INSERT INTO cityy VALUES ('Kolkata',70000,'West Bengal');
INSERT INTO cityy VALUES ('noida',15000,'UP');
INSERT INTO cityy VALUES ('ghaziabad',80000,'UP');
*/
-- fetch

SELECT cityname, cityPop, p.state,
CAST(ROUND(((cityPop/TOTAL)*100),0) AS FLOAT) as 'Percentage contribution of city to state''s total population'
FROM cityy p
JOIN (SELECT state, SUM(cityPop) as 'TOTAL'
FROM cityy
GROUP BY state) t ON p.state = t.state
ORDER BY p.state, citypop DESC ;

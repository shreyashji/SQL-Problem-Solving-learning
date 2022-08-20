#WRITE SQL TO FIND TOTTAL number of employee present in hospital
create table july.hospital ( emp_id int
, action varchar(10)
, time datetime);

insert into july.hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into july.hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into july.hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into july.hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into july.hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into july.hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into july.hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into july.hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into july.hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into july.hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into july.hospital values ('5', 'out', '2019-12-22 09:40:00');
#method 1 : having clause,last max in time should be greater than  last out time,independently checking for each employee,234 ans
SELECT * FROM july.hospital;

WITH recursive cte_a AS (
SELECT *
,max(case when action='in' then hospital.time end) as intime
,max(case when action='out' then hospital.time end )as outime
 FROM july.hospital
 GROUP BY Emp_id)
SELECT * FROM cte_a
WHERE intime>outime or outime is null;

having max(case when action='in' then hospital.time end) > max(case when action='out' then hospital.time end )
or max(case when action='out' then hospital.time end ) is NULL;

#METHOD 2 : 
SELECT * FROM july.hospital;

with recursive cte_in as (
	SELECT emp_id,max(time) as latest_in_time 
	FROM july.hospital WHERE action='in' GROUP BY emp_id
),
cte_out as (
	SELECT emp_id,max(time) as latest_out_time 
	FROM july.hospital WHERE action='out' GROUP BY emp_id
)
SELECT * FROM cte_in intime
LEFT JOIN cte_out outime ON  intime.emp_id=outime.emp_id
WHERE latest_in_time > latest_out_time or latest_out_time is null;

#method 3 : latest activity of employee is in then guy is into
with recursive latest_time as (
	SELECT emp_id,max(time) as max_latest_time 
	FROM july.hospital
    group by emp_id
),
latest_in_time as (
	SELECT emp_id,max(time) as max_in_time  FROM july.hospital
     WHERE action='in' group by emp_id
)
SELECT * FROM latest_time lt
INNER JOIN latest_in_time lit on lt.emp_id= lit.emp_id and max_latest_time=max_in_time
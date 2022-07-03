
use it;
create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

#write a sql query to determine phone number that satisfy below conditions;
#1. the number have both incoming & outgoing calls
#2. the sum of duration of outgoing calls should be greater than the sum of duration of incoming calls

SELECT * FROM call_details;

#1. CTE and FILTER(where) clause
WITH recursive CTE_a AS (
	SELECT call_numbeR
	,SUM(CASE WHEN call_type='OUT' THEN call_duration ELSE NULL END) AS out_duration
	,SUM(CASE WHEN call_type='INC' THEN call_duration ELSE NULL END) AS INCOMING_duration
	FROM call_details
	GROUP BY call_number
)
select call_number FROM CTE_a
WHERE out_duration IS NOT NULL AND INCOMING_duration IS NOT NULL AND out_duration > INCOMING_duration;

#2. Magic of having clause
SELECT call_number
FROM call_details
GROUP BY call_number
HAVING 
SUM(CASE WHEN call_type='OUT' THEN call_duration ELSE NULL END) >0 AND 
SUM(CASE WHEN call_type='INC' THEN call_duration ELSE NULL END) > 0
AND SUM(CASE WHEN call_type='OUT' THEN call_duration ELSE NULL END) >
SUM(CASE WHEN call_type='INC' THEN call_duration ELSE NULL END);
 
#3. CTE and inner join
WITH recursive CTE_OUT AS (
	SELECT call_number
	,SUM(call_duration) AS duration
	FROM call_details
    WHERE call_type='OUT'
	GROUP BY call_number
), 
CTE_IN AS (
	SELECT call_number
	,SUM(call_duration) AS duration
	FROM call_details
    WHERE call_type='INC'
	GROUP BY call_number
)
select ci.call_number FROM CTE_OUT co
inner join CTE_IN ci #out and in no which is in both will be only qualified
ON CO.call_number = CI.call_number
WHERE CO.duration  > CI.duration;


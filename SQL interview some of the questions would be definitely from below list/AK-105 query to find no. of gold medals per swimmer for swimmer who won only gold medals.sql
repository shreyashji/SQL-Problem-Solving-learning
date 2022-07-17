use it;

CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

delete from events;

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');


SELECT * FROM events;
#WRITE a sql query to find no. of gold medals per swimmer for swimmer who won only gold medals
#subquery 
SELECT gold as Playername,Count(1) as no_of_medals
from events
where gold not in (SELECT SILVER FROM events UNION ALL SELECT BRONZE FROM EVENTS )
group by gold;

#having group by
WITH RECURSIVE cte_A as (
SELECT GOLD AS PLAYER_NAME,'GOLD' AS Medal_type FROM EVENTS 
UNION ALL
SELECT SILVER,'SILVER' AS Medal_type FROM EVENTS 
UNION ALL
SELECT BRONZE,'BRONZE' AS Medal_type FROM EVENTS
)
SELECT PLAYER_NAME,COUNT(1) AS no_of_golad_nedal from cte_A
group by PLAYER_NAME
having count(distinct Medal_type)=1 and max(Medal_type)='gold'

#Union all will give better performance in case of large data
#Union all :  give duplicates too
#Union : gives only distinct values
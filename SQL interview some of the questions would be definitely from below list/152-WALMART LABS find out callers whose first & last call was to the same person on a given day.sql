# CALler call history contains in this table
#find out callers whose first & last call was to the same person on a given day
use july;
create table july.phonelog(
    Callerid int, 
    Recipientid int,
    Datecalled datetime
);

insert into july.phonelog(Callerid, Recipientid, Datecalled)
values(1, 2, '2019-01-01 09:00:00.000'),
       (1, 3, '2019-01-01 17:00:00.000'),
       (1, 4, '2019-01-01 23:00:00.000'),
       (2, 5, '2019-07-05 09:00:00.000'),
       (2, 3, '2019-07-05 17:00:00.000'),
       (2, 3, '2019-07-05 17:20:00.000'),
       (2, 5, '2019-07-05 23:00:00.000'),
       (2, 3, '2019-08-01 09:00:00.000'),
       (2, 3, '2019-08-01 17:00:00.000'),
       (2, 5, '2019-08-01 19:30:00.000'),
       (2, 4, '2019-08-02 09:00:00.000'),
       (2, 5, '2019-08-02 10:00:00.000'),
       (2, 5, '2019-08-02 10:45:00.000'),
       (2, 4, '2019-08-02 11:00:00.000');
       
SELECT * FROM july.phonelog;

WITH recursive CRE_CALL AS (       
	SELECT callerid,cast(datecalled as date) as calleddate,MIN(datecalled) AS First_call,MAX(datecalled) AS last_call FROM july.phonelog
	GROUP BY callerid,cast(datecalled as date)
)
SELECT C.*,P1.Recipientid as First_Recepient,P2.Recipientid as last_Recepient FROM CRE_CALL C
INNER JOIN july.phonelog P1 ON C.callerid = P1.callerid AND C.First_call=P1.datecalled
INNER JOIN july.phonelog P2 ON C.callerid = P2.callerid AND C.last_call=P2.datecalled
where P1.Recipientid=P2.Recipientid
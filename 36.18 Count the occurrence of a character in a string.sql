create table survey (
surveyid int,
response varchar(150)
);
#DROP TABLE survey;
select * from survey;
#insert into survey values (1,'ZZZZZXXXXCCCVVVBBNNMMLLKHJFGDFSDASASSAAQWEWERETRTYRYIYYIOIPUT');
#insert into survey values (2,'QWPDHBCNFDHFFGALSDDCS');

SELECT  surveyid,response,length(response) , replace(response,'Y',''), length(replace(response,'Y',''))
 from survey;
 
 
SELECT  surveyid,response,length(response) - length(replace(response,'Y','')) as stringoccured
 from survey;
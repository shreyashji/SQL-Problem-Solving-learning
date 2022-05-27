Create table If Not Exists Person2 (id int, email varchar(255));
Truncate table Person;
insert into Person2  values ('1', 'a@b.com');
insert into Person2  values ('2', 'c@d.com');
insert into Person2  values ('3', 'a@b.com');
#insert into Person2 (id, email) values ('3', 'a@b.com')
/*
Example 1:
Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
*/

# Write your MySQL query statement below
select * from PERSON2;
#select Email
#from Person
#group by Email
#having count(*) > 1

#or 
WITH temp_table AS
(
    SELECT email,
    ROW_NUMBER() OVER(PARTITION BY email ORDER BY email) AS r_num
    FROM PERSON2
) 
SELECT DISTINCT email FROM temp_table WHERE r_num <>1
/*
Create table If Not Exists Person (Id int, Email varchar(255));
#Truncate table Person;
insert into Person values (1, 'john@example.com');
insert into Person values (2, 'bob@example.com');
insert into Person  values (3, 'john@example.com');
#insert into Person (id, email) values (3, 'john@example.com')
*/
/*
Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
*/
#Delete Duplicate Emails | Leetcode 196 | Week 4 | Qs 22

with temp_table as(
    SELECT id,
    email,
    row_number() over(partition by email order by id asc) as r_num
    from person
)
DELETE FROM person where id in ( SELECT id from temp_table where r_num <>1)


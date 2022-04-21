#create table Contests ( contest_id INT, hacker_id INT, name VARCHAR(200) );

#insert into Contests (contest_id, hacker_id, name) values (66406, 17973, 'Rose'), (66556, 79153, 'Angela'), (94828, 80275, 'Frank');

#create table Colleges( college_id INT, contest_id INT );

#insert into Colleges (college_id, contest_id) values (11219, 66406), (32473, 66556), (56685, 94828);

#create table Challenges ( challenge_id INT, college_id INT );

#insert into Challenges (challenge_id, college_id) values (18765, 11219), (47127, 11219), (60292, 32473), (72974, 56685);

#create table View_Stats ( challenge_id INT, total_views INT, total_unique_views INT );

#insert into View_Stats (challenge_id, total_views, total_unique_views) values (47127, 26, 19), (47127, 15, 14), (18765, 43, 10), (18765, 72, 13), (75516, 35, 17), (60292, 11, 10), (72974, 41, 15), (75516, 75, 11);

#create table Submission_Stats ( challenge_id INT, total_submissions INT, total_accepted_submissions INT );

#insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values (75516, 34, 12), (47127, 27, 10), (47127, 56, 18), (75516, 74, 12), (75516, 83, 8), (72974, 68, 24), (72974, 82, 14), (47127, 28, 11);

/* Question*
John interviews many candidates from different colleges using coding challenges and contests. 
Write a query which displays the contest_id, hacker_id, name, sums of total_submissions, 
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
Exclude the contest from the result if all four sums are zero .
*/
select * from Contests;
select * from Colleges;
select * from Challenges;
select * from View_Stats;
select * from Submission_Stats;

select con.contest_id,
        con.hacker_id, 
        con.name, 
        sum(total_submissions), #stats table
        sum(total_accepted_submissions), #stats table
        sum(total_views), #from view_stats
		sum(total_unique_views)
from contests con 
join colleges col on con.contest_id = col.contest_id 
join challenges cha on  col.college_id = cha.college_id 
left join
(select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views
	from view_stats group by challenge_id) vs on cha.challenge_id = vs.challenge_id 
left join
(select challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions 
 from submission_stats group by challenge_id) ss on cha.challenge_id = ss.challenge_id
    group by con.contest_id, con.hacker_id, con.name;
/*        
        having sum(total_submissions)!=0 or 
                sum(total_accepted_submissions)!=0 or
                sum(total_views)!=0 or
                sum(total_unique_views)!=0
            order by contest_id;
*/

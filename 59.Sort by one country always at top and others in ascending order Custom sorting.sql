#Sort by one country always at top and others in ascending order | Custom sorting
create table counntry (
country_id int,
countrynames varchar(20)
);

#drop table country;
#insert into counntry values (1,"Afganistan"),(2,"Australia"),(3,"China"),(1,"France"),(1,"Germany"),(1,"India"),(1,"Italy");

select * from counntry
ORDER BY 
(CASE WHEN countrynames="India" then 0
 WHEN countrynames="China" then 1 else 2 end),
countrynames;
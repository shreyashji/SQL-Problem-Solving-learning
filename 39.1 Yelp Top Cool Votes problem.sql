#Top Cool Votes
#Find the review_text that received the highest number of  'cool' votes
#Output the business name along with the review text with the highest numbef of 'cool' votes.

select business_name,review_text from
(select business_name,review_text,cool,
dense_rank() over(order by cool desc) as rnk
 from yelp_reviews) sub
 where rnk=1
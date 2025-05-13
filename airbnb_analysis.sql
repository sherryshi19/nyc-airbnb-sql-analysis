-- Which neighborhoods have the highest and lowest ratings?
with x as (
select 
	neighbourhood_group_cleansed as borough, 
	neighbourhood_cleansed as neighborhood,
	COUNT(review_scores_value) as num_reviews_per_neighborhood
from airbnb_listings
where review_scores_value is not null 
group by neighbourhood_group_cleansed, neighbourhood_cleansed
order by num_reviews_per_neighborhood desc
)
select avg(num_reviews_per_neighborhood) as avg_num_reviews_per_neighborhood
from x; -- Calculates the average number of reviews per neighborhood. The result is 71 which is used as a cutoff for the two queries below

select 
	neighbourhood_group_cleansed as borough, 
	neighbourhood_cleansed as neighborhood,
	COUNT(review_scores_value) as num_reviews_per_neighborhood, 
	ROUND(AVG(review_scores_value)::numeric, 2) as avg_neighborhood_rating
from airbnb_listings
where review_scores_value is not null 
group by neighbourhood_group_cleansed, neighbourhood_cleansed
having COUNT(review_scores_value) >= 71
order by avg_neighborhood_rating desc -- Top 5 neighborhoods with the highest average rating
limit 5;

select 
	neighbourhood_group_cleansed as borough, 
	neighbourhood_cleansed as neighborhood,
	COUNT(review_scores_value) as num_reviews_per_neighborhood, 
	ROUND(AVG(review_scores_value)::numeric, 2) as avg_neighborhood_rating
from airbnb_listings
where review_scores_value is not null 
group by neighbourhood_group_cleansed, neighbourhood_cleansed
having COUNT(review_scores_value) >= 71
order by avg_neighborhood_rating -- bottom 5 neighborhoods with the lowest average rating
limit 5;


-- What is the average price per night for a listing in NYC?
select round(avg(price)::numeric,2) as avg_price_per_night
from airbnb_listings;


-- Which boroughs have the highest and lowest average prices per night?
select 
	neighbourhood_group_cleansed as borough, 
	round(avg(price)::numeric,2) as avg_price_per_borough
from airbnb_listings
group by neighbourhood_group_cleansed
order by avg_price_per_borough desc;


-- Which neighborhoods have the most listings?
select 
	neighbourhood_group_cleansed as borough, 
	neighbourhood_cleansed as neighborhood, 
	count(*) as listing_count
from airbnb_listings
group by neighbourhood_group_cleansed, neighbourhood_cleansed
order by listing_count desc
limit 10;


-- What are the most common property types in NYC Airbnb listings?
select 
	room_type,
	property_type, 
	count(*) as listings_per_property_type
from airbnb_listings
group by room_type, property_type
order by listings_per_property_type desc
limit 10;


-- Do superhosts generally have higher-priced listings?
select 
	host_is_superhost as superhost,
	round(avg(price)::numeric, 2) AS avg_price,
	count(*) AS listing_count
from airbnb_listings
where price is not null 
	and host_is_superhost <> ''
group by host_is_superhost;


-- Do listings with a verified host identity or profile picture tend to have more reviews or higher ratings?
select 
	host_identity_verified,
	host_has_profile_pic,
	round(avg(number_of_reviews)::numeric,2) as avg_review,
	round(avg(review_scores_value)::numeric,2) as avg_review_rating
from airbnb_listings
where host_identity_verified <> ''
	and host_has_profile_pic <> ''
group by host_identity_verified, host_has_profile_pic
order by avg_review_rating desc;









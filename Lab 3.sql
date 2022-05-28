-- How many distinct (different) actors' last names are there?
select distinct last_name
from actor;

-- In how many different languages where the films originally produced?
select count(distinct language_id)
from film;

-- How many movies were released with "PG-13" rating?
select count(distinct film_id) 
from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select title, length
from film
where release_year = '2006'
order by length desc
limit 10; 

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT MAX(DATEDIFF(return_date, rental_date))
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
select *, 
extract(month from rental_date) as month,
weekday(rental_date) as weekday
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select 
case when weekday(rental_date) in (6,7) then 'weekend' else 'Weekday' end as day_type
from rental;

-- How many rentals were in the last month of activity?
select count(rental_id)
from rental
where max(date(rental_date));

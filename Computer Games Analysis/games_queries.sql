select *
from games_data;

-- check for duplicates --
select name, developer, count(*)
from games_data
group by name, developer
having count(*) > 1

-- 'A Hat in Time' from two different producers 
select *
from games_data
where name like 'A Hat in Time'

-- how many developers -- 583 total 
select developer, count(*) as games_count
from games_data
group by developer
order by games_count desc

-- top 10 developers 
select developer, count(*) as games_count
from games_data
group by developer
order by games_count desc,
	developer
limit 10;

-- top 10 producers 
select producer, count(*) as games_count
from games_data
group by producer
order by games_count desc,
	producer
limit 10;


-- top 10 genres 
select genre, count(*) as games_count
from games_data
group by genre
order by games_count desc,
	genre
limit 10;

-- top 10 operating systems 
select operating_system, count(*) as games_count
from games_data
group by operating_system
order by games_count desc,
	operating_system
limit 10;

-- in what year were the most games released? 

drop table if exists years_data
create temp table years_data as

select name, genre,
	(right(games_data.date_releasesd, 4))::integer as year_released
from games_data
where games_data.date_releasesd not like '%Early Access%'
	and games_data.date_releasesd not like '%TBA%'
order by year_released desc

select year_released, count(name) as games_count
from years_data
group by year_released
order by games_count desc
limit 10


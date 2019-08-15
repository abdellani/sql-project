---------------------------
--1
SELECT id, title
FROM movie
WHERE yr=1962
---------------------------
--2
select yr
from movie
where title= 'Citizen Kane'
---------------------------
--3
select id,title,yr
from movie
where title like '%Star Trek%'
---------------------------
--4
select id 
from actor 
where name = 'Glenn Close'
---------------------------
--5
select id
from movie
where title = 'Casablanca' 
---------------------------
--6
select actor.name 
from casting join actor 
on casting.actorid = actor.id
where movieid =(select id 
  from movie 
  where title = 'Casablanca')
---------------------------
--7
select actor.name
from  casting join actor on casting.actorid = actor.id
where movieid = (select id 
  from movie 
  where title ='Alien')
---------------------------
--8
select movie.title
from movie join casting join actor
on movie.id=casting.movieid
and casting.actorid = actor.id
where actor.name =  'Harrison Ford'
---------------------------
--9
select movie.title
from movie join casting join actor
on movie.id = casting.movieid 
    and
    casting.actorid=actor.id
where 
  actor.name='Harrison Ford'
  and
  casting.ord <> 1;
---------------------------
--10
select movie.title, actor.name
from movie join casting join actor
on movie.id=casting.movieid and casting.actorid = actor.id
where
movie.yr=1962 and casting.ord=1
---------------------------
--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(title) > 2
---------------------------
--12
select  movie.title,actor.name 
from movie join casting join actor
on movie.id=casting.movieid and casting.actorid=actor.id
where casting.ord=1
  and
  movie.id in (select movie.id
    from movie join casting join actor
    on movie.id=casting.movieid and casting.actorid=actor.id
    where actor.name='Julie Andrews')
---------------------------
--13
select actor.name
from actor join casting on actor.id = casting.actorid
where casting.ord=1
group by actor.name
having count(casting.ord)>=30
order by actor.name;
---------------------------
--14
select movie.title,count(actor.name)
from movie join casting join actor
on movie.id=casting.movieid and casting.actorid=actor.id
where movie.yr=1978
group by movie.title 
order by count(actor.name) desc,title
---------------------------
--15
select distinct(actor.name) 
from actor join casting on casting.actorid = actor.id
where actor.name <> 'Art Garfunkel'
and casting.movieid in (select casting.movieid 
            from actor join casting 
            on actor.id=casting.actorid
            where actor.name='Art Garfunkel')
---------------------------
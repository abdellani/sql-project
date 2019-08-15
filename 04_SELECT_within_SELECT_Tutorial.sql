---------------------------
--1
SELECT name
FROM world
WHERE population > (SELECT population
  FROM world
  WHERE name = 'Russia')
---------------------------
--2
select name
from world
where
continent='europe'
  and
  gdp/population > (select gdp/population
  from world
  where
  name = 'United kingdom')
---------------------------
--3
select name, continent
from world
where 
continent in (select continent
  from world
  where 
  name = 'Argentina'
  or
  name = 'Australia')
order by name;
---------------------------
--4
select name, population 
from world
where population > ( select population 
  from world
  where name = 'canada')
and
population < ( select population 
  from world
  where name = 'poland');
---------------------------
--5
select name, concat(round(population/(
                          select population 
                          from world 
                          where name = 'germany' 
                          )*100,
                        0),
                      '%')
from world
where 
continent = 'europe';
---------------------------
--6
select name 
from world
where gdp > ( select max(gdp) 
  from world 
  where continent = 'europe' )
---------------------------
--7
select  x.continent,name,x.area
from world as x 
where area =( select max(area)
  from world as y
  where x.continent=y.continent) 
-- another solution
select  world.continent,name,world.area
from
world,(select continent, max(area) as area
from world 
group by continent) as largest where 
world.continent=largest.continent
and
world.area=largest.area
---------------------------
--8
select continent,name
from world as x
where name =(select name 
  from world as y 
  where x.continent= y.continent
  order by name limit 1) 
---------------------------
--9
select name, continent,population 
from world as x
where 25000000 >= ( select max(population) 
  from world as y
  where
  x.continent = y.continent)
---------------------------
--10
select name, continent 
from world as x
where 
population >  3*( select max(population)
  from world as y
  where
    x.continent = y.continent
  and
  x.name <> y.name)
---------------------------
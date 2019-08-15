---------------------------
--1
select count(id)
from stops
---------------------------
--2
select id 
from stops
where name = 'Craiglockhart' 
---------------------------
--3
select id, name 
from stops join route on stops.id = route.stop
where route.num= 4 and company='LRT'
---------------------------
--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*)=2
---------------------------
--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
and b.stop=149
---------------------------
--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
and stopb.name= 'London Road'
---------------------------
--7
select a.company,a.num
from route a join route b 
on (a.company= b.company and a.num=b.num)
where a.stop= 115 and b.stop=137
group by company,num;
---------------------------
--8
select a.company,a.num
from route a 
join route b on (a.company = b.company 
                and a.num = b.num)
join stops stopsa on (a.stop=stopsa.id)
join stops stopsb on (b.stop=stopsb.id)
where stopsa.name = 'Craiglockhart' 
      and 
      stopsb.name ='Tollcross' 
---------------------------
--9
select stopsb.name,a.company,a.num
from route a 
join route b on (a.company = b.company 
                and a.num = b.num)
join stops stopsa on (a.stop=stopsa.id)
join stops stopsb on (b.stop=stopsb.id)
where stopsa.name = 'Craiglockhart'
group by a.company,a.num,stopsb.name
---------------------------
--10
select tab_1.num, tab_1.company,tab_1.name,tab_2.num, tab_2.company
from  (
select stopsb.name,a.company,a.num
from route a 
join route b on (a.company = b.company 
                and a.num = b.num)
join stops stopsa on (a.stop=stopsa.id)
join stops stopsb on (b.stop=stopsb.id)
where stopsa.name = 'Craiglockhart'
group by a.company,a.num,stopsb.name ) as tab_1
join
(select stopsb.name,a.company,a.num
from route a 
join route b on (a.company = b.company 
                and a.num = b.num)
join stops stopsa on (a.stop=stopsa.id)
join stops stopsb on (b.stop=stopsb.id)
where stopsa.name = 'Lochend'
group by a.company,a.num,stopsb.name) tab_2
on (
  tab_1.name =   tab_2.name
  and 
  tab_1.num <>   tab_2.num
)
---------------------------

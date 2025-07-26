-- count number of athletes from each country

select Country, count(PersonName) as TotalAthletes
from athletes
group by Country
order by TotalAthletes desc;


-- count number of athletes in each discipline
select Discipline, count(PersonName) as TotalAthletes 
from athletes
group by Discipline
order by TotalAthletes desc;


-- count the number of athletes who participated in more than 1 discipline
select count(distinct PersonName) from athletes    --11062
select count(*) from athletes                      --11085


select PersonName, count(*) as Total 
       from athletes
       group by PersonName
       having count(*) > 1

select count(*) as TotalRows
from (select PersonName, count(*) as Total 
       from athletes
       group by PersonName
       having count(*) > 1) as Table1


---count number of coaches for each discipline
select * from coaches
select count(*) from coaches    --394
select distinct Discipline from coaches   --9

select Discipline, count(Name) as NumberOfCoaches
from coaches
group by Discipline
order by NumberOfCoaches desc

 --which country has maximum number of coaches
select top 1 Country, count(Name) as NumberOfCoaches
from coaches
group by Country
order by NumberOfCoaches desc


--- list out the disciplines where number of females is greater than and equal to number of males
select * from entriesgender

select *
from entriesgender
where Female >= Male


---rank the countries by the total number of silver medals
select * from medals
select count(*) from medals

select TeamCountry, Silver,
DENSE_RANK() OVER(order by Silver desc) as Rank_By_Silver
from medals


---count the number of events in each event category in each discpline
select count(*) from teams
select * from teams

select Discipline, 
t.event, 
count(Event) as CountByEvent
from teams t
group by discipline, t.event
order by Discipline





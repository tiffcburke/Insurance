/*
Looking into an auto insurance book of business where policy holders have had one accident claim. What are the demographics of this group? Are there any trends?
*/

--Creating a temporary table we can use to look at the demographics of a policyholders with 1 accident claim.
select * 
into #one_claim
from insurance..car_ins
where PAST_ACCIDENTS = 1

--Number of policyholders with one claim = 1,783 (17%)
select count(*)
from #one_claim

--Grouping by age, the older you get the least likely you are to only have one accident. Older you get the more accidents you get in.
select age, count(age) as agecount
from #one_claim
group by age
order by agecount

--Grouping by gender- not a significant difference
select gender, count(gender)
from #one_claim
group by gender

-- Grouping by income you see a gradual increase- the higher income the more likely to have one claim.
select income, count(income) incomecount
from #one_claim
group by income
order by incomecount

-- Majority of policyholders own a car
select vehicle_ownership, count(vehicle_ownership)
from #one_claim
group by VEHICLE_OWNERSHIP


--More policyholders have old cars than new.. nothing really to note here.
select vehicle_year, count(vehicle_year)
from #one_claim
group by vehicle_year

-- Half married half not married
select married, count(married)
from #one_claim
group by married

--Majority have children
select children, count(children)
from #one_claim
group by children


select *
from #one_claim




/*
Looking into an auto insurance book of business where policy holders have had 4+ accidents claims. What are the demographics of this group? Are there any trends?
*/

--Creating a temp table for policyholders with 4 plus accident claims. 
select * 
into #fourplus_claims
from insurance..car_ins
where PAST_ACCIDENTS >= 4

--883 policyholders have had 4 or more accident claims
select count(*)
from #fourplus_claims

--The older age groups have more accident claims.
select age, count(age)
from #fourplus_claims
group by age

-- Majority men
select gender, count(gender)
from #fourplus_claims
group by gender

-- eh
select education, count(education)
from #fourplus_claims
group by education


-- Mostly upper class
select income, count(income)
from #fourplus_claims
group by income

--Most own a car
select vehicle_ownership, count(vehicle_ownership)
from #fourplus_claims
group by vehicle_ownership

-- Most have older cars
select vehicle_year, count(vehicle_year)
from #fourplus_claims
group by vehicle_year

-- Majority have children
select children, count(children)
from #fourplus_claims
group by children

-- mostly sedans
select vehicle_type, count(vehicle_type)
from #fourplus_claims
group by vehicle_type

--Interesting display of speeding violations 
select speeding_violations, count(speeding_violations)
from #fourplus_claims
group by speeding_violations
order by speeding_violations desc


select duis, count(duis)
from #fourplus_claims
group by duis
order by duis

select duis, count(duis)
from Insurance..car_ins
group by duis
order by duis

select * 
from #fourplus_claims






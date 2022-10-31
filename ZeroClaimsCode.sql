/*
Looking into an auto insurance book of business where policy holders have had zero accidents claims. What are the demographics of this group? Are there any trends?
*/

--Temp table for policy holders with zero claims. 
select * 
into #zero_claims
from insurance..car_ins
where PAST_ACCIDENTS = 0

Select count(*)
from #zero_claims
where age = '16-25'

--Looking into how gender applies to accident claims. 
-- 100% of 16-25 year olds male or female have had zero accidents 
select gender, count(gender)
from #zero_claims
group by gender

select gender, count(gender)
from Insurance..car_ins
group by gender

select age, count(age) as age_count
from #zero_claims
where gender = 'female'
--where gender = 'male'
group by age
order by age_count

select age, count(age) as age_count
from #zero_claims
group by age
order by age_count

select age, count(age)
from insurance..car_ins i
--where gender = 'female'
--where gender = 'male'
group by i.age
order by i.age

--Looking into the 16-25 age group becuase 100% of that group has zero accidents. 
-- The biggest take away is that half of this age group does not own their cars of those the majority 
-- are in poverty. of this group that does own a car, a third are in poverty. Assuming this group does not drive as often as the other groups
select education, count(education) as education_count 
from #zero_claims
where age = '16-25'
group by education 
-- pretty spead out

select income, count(income) as income_count 
from #zero_claims
where age = '16-25'
group by income 
-- majority in proverty 

select income, count(income) as income_count 
from #zero_claims
where age = '16-25'
group by income 

select vehicle_ownership, count(vehicle_ownership)
from #zero_claims
where age = '16-25'
group by vehicle_ownership
-- about half do not own a car

select vehicle_year, count(vehicle_year)
from #zero_claims
where age = '16-25'
group by vehicle_year
-- mostly all older vehicles

select avg(annual_mileage) as avg_mileage
from #zero_claims
where age = '16-25'
-- 12,940

select vehicle_type, count(vehicle_type)
from #zero_claims
where age = '16-25'
group by vehicle_type
-- mostly sedans


select income, count(income)
from #zero_claims
where age = '16-25'
and vehicle_ownership = 0
group by income
--half of this group does not own a vehicle 
--most are in poverty and do not own vehilce 

select income, count(income)
from #zero_claims
where age = '16-25'
and vehicle_ownership = 1
group by income
--half of this group owns a vehicle
-- a third are in poverty, third in working class


--Zero claims income
select income, count(income)
from #zero_claims
group by income
-- pretty even split between all 4 classes


-- Zero claims and owning a vehicle 
select vehicle_ownership, count(vehicle_ownership)
from #zero_claims
group by vehicle_ownership
--more people own cars than not by 1500

select vehicle_year, count(vehicle_year)
from #zero_claims
where vehicle_ownership = 1
group by vehicle_year
-- of those who own a car, more own an older car

--married
select married, count(married)
from #zero_claims
group by married
-- more are not married

--average annual mileage
-- avg mileage consistently goes down as the claim count goes up.
select avg(annual_mileage)
from #zero_claims
--12,110

select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 1
--11,593

select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 2
--11,264


select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 3
--10,935

select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 4
--10,658

select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 5
--10,620

select avg(annual_mileage)
from insurance..car_ins
where past_accidents = 6
-10,000

select avg(annual_mileage)
from insurance..car_ins
where past_accidents > 7
--9,394

select speeding_violations, count(speeding_violations)
from #zero_claims
group by speeding_violations
order by speeding_violations
-- zero speeding violations = 4170 vs maybe 1k who got 1+
-- speeding violations are a good indicator of zero claims. 

select count(*)
from Insurance..car_ins









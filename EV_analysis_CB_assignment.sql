--Preliminary questions

--Q1: List the top 3 and bottom 3 makers for the fiscal years 2023 in terms of the number of 2-wheelers sold.



--Top 3 makers of 2 wheelers in 2023
select top 3 maker , sum(electric_vehicles_sold) as total_ev_sales
from ev_sales_makers
where DATEPART(year,date) = '2023' and vehicle_category = '2-Wheelers'
group by maker
order by sum(electric_vehicles_sold) desc;

--Bottom 3 makers of 2 wheelers in 2023
select top 3 maker , sum(electric_vehicles_sold) as total_ev_sales
from ev_sales_makers
where DATEPART(year,date) = '2023' and vehicle_category = '2-Wheelers'
group by maker
order by sum(electric_vehicles_sold) asc;

--Top 3 makers of 2 wheelers in 2024
select top 3 maker , sum(electric_vehicles_sold) as total_ev_sales
from ev_sales_makers
where DATEPART(year,date) = '2024' and vehicle_category = '2-Wheelers'
group by maker
order by sum(electric_vehicles_sold) desc;

--Bottom 3 makers of 2 wheelers in 2024
select top 3 maker , sum(electric_vehicles_sold) as total_ev_sales
from ev_sales_makers
where DATEPART(year,date) = '2024' and vehicle_category = '2-Wheelers'
group by maker
order by sum(electric_vehicles_sold) asc;

--Q2: Identify the top 5 states with the highest penetration rate in 2-wheeler and 4-wheeler EV sales in FY 2024.

--alter table ev_sales_state
--alter column total_vehicles_sold int

select top 5 state, (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold)) as penetration_rate
from ev_sales_state
group by state
order by (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold)) desc;

--Q3: List the states with negative penetration (decline) in EV sales from 2022 to 2024?

with cte as (select state 
, case when DATEPART(year,date) = '2022' then (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold))  else '0' end as penetration_rate_year_2022
, case when DATEPART(year,date) = '2024' then (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold)) else '0'  end as penetration_rate_year_2024
from ev_sales_state
group by state , date)

select state, penetration_rate_year_2024 - penetration_rate_year_2022 as diff_rate
from cte
where penetration_rate_year_2024 - penetration_rate_year_2022 < 0
;

-- Q4: What are the quarterly trends based on sales volume for the top 5 EV makers (4-wheelers) from 2022 to 2024? 
--Q1
--2022
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q1_22
from ev_sales_makers
where DATEPART(year,date) = '2022' and datepart(month,date) between '4' and '6' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2023
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q1_23
from ev_sales_makers
where DATEPART(year,date) = '2023' and datepart(month,date) between '4' and '6' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2024
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q1_24
from ev_sales_makers
where DATEPART(year,date) = '2024' and datepart(month,date) between '4' and '6' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--Q2
--2022
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q2_22
from ev_sales_makers
where DATEPART(year,date) = '2022' and datepart(month,date) between '7' and '9' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2023
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q2_23
from ev_sales_makers
where DATEPART(year,date) = '2023' and datepart(month,date) between '7' and '9' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2024
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q2_24
from ev_sales_makers
where DATEPART(year,date) = '2024' and datepart(month,date) between '7' and '9' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--Q3
--2022
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q3_22
from ev_sales_makers
where DATEPART(year,date) = '2022' and datepart(month,date) between '10' and '12' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2023
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q3_23
from ev_sales_makers
where DATEPART(year,date) = '2023' and datepart(month,date) between '10' and '12' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2024
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q3_24
from ev_sales_makers
where DATEPART(year,date) = '2024' and datepart(month,date) between '10' and '12' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--Q4
--2022
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q4_22
from ev_sales_makers
where DATEPART(year,date) = '2022' and datepart(month,date) between '1' and '3' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2023
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q4_23
from ev_sales_makers
where DATEPART(year,date) = '2023' and datepart(month,date) between '1' and '3' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;
--2024
select top 5 maker, sum(electric_vehicles_sold) as total_ev_sales_Q4_24
from ev_sales_makers
where DATEPART(year,date) = '2024' and datepart(month,date) between '1' and '3' and vehicle_category = '4-Wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;

--Q5: How do the EV sales and penetration rates in Delhi compare to Karnataka for 2024?

--ev sales
with cte1 as (
select case when state='Delhi' then sum(electric_vehicles_sold) end as total_sales_delhi
, case when state='Karnataka' then sum(electric_vehicles_sold) end as total_sales_karnataka
from ev_sales_state
group by state , DATEPART(year,date)
having DATEPART(year,date) = '2024')

select STRING_AGG(total_sales_delhi,'') as total_sales_delhi, STRING_AGG(total_sales_karnataka,'') as total_sales_Karnataka
from cte1;

--penetration rates
with cte1 as (
select case when state='Delhi' then (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold)) end as penetration_rate_delhi
, case when state='karnataka' then (sum(electric_vehicles_sold)*1.0/sum(total_vehicles_sold)) end as penetration_rate_karnataka
from ev_sales_state
group by state , DATEPART(year,date)
having DATEPART(year,date) = '2024')

select STRING_AGG(penetration_rate_delhi,'') as penetration_rate_Delhi, STRING_AGG(penetration_rate_karnataka,'') as penetration_rate_Karnataka
from cte1;

--Q6: List down the compounded annual growth rate (CAGR) in 4-wheeler units for the top 5 makers from 2022 to 2024.

select top 5 maker , sum(electric_vehicles_sold) as total_sales
from ev_sales_makers
where datepart(year,date) = '2022' and vehicle_category = '4-wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc


select top 5 maker , sum(electric_vehicles_sold) as total_sales
from ev_sales_makers
where datepart(year,date) = '2024' and vehicle_category = '4-wheelers'
group by maker, datepart(year,date)
order by sum(electric_vehicles_sold) desc;

--Q7: List down the top 10 states that had the highest compounded annual growth rate (CAGR) from 2022 to 2024 in total vehicles sold.

select state,  sum(total_vehicles_sold)  as total_sales
from ev_sales_state
where datepart(year,date) = '2022' and vehicle_category = '4-wheelers' 
group by state, datepart(year,date) 
order by state

select state,  sum(total_vehicles_sold)  as total_sales
from ev_sales_state
where datepart(year,date) = '2024' and vehicle_category = '4-wheelers' 
group by state, datepart(year,date) 
order by state;

--Q8: What are the peak and low season months for EV sales based on the data from 2022 to 2024?

--2022
select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2022'
group by datepart(month,date)
order by sum(electric_vehicles_sold) desc

select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2022'
group by datepart(month,date)
order by sum(electric_vehicles_sold) asc;

--2023
select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2023'
group by datepart(month,date)
order by sum(electric_vehicles_sold) desc

select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2023'
group by datepart(month,date)
order by sum(electric_vehicles_sold) asc;

--2024
select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2024'
group by datepart(month,date)
order by sum(electric_vehicles_sold) desc

--2024
select top 1 datepart(month,date) as month , sum(electric_vehicles_sold)  as total_sales
from ev_sales_makers
where datepart(year,date) = '2024'
group by datepart(month,date)
order by sum(electric_vehicles_sold) asc;

-- Q9: What is the projected number of EV sales (including 2-wheelers and 4-wheelers) for the top 10 states by penetration rate in 2030, based on the compounded annual growth rate (CAGR) from previous years?

--CAGR : 2021-2023 : [(Ending Value / Beginning Value) ** 1/n] -1
with cte as (select state
,case when DATEPART(year,date) = '2022'then sum(electric_vehicles_sold) else 0 end as total_sales_21
,case when DATEPART(year,date) = '2024'then sum(electric_vehicles_sold) else 0 end as total_sales_23
from ev_sales_state
group by state, DATEPART(year,date)) 


SELECT 
    state, 
    CASE 
        WHEN total_sales_21 = 0 AND total_sales_23 = 0 THEN 'No growth'
        WHEN total_sales_21 = 0 AND total_sales_23 != 0 THEN 'Error'
        WHEN total_sales_21 != 0 AND total_sales_23 != 0 THEN 
             POWER(((total_sales_23*1.0)/ (total_sales_21)),0.5) - 1
    END AS CAGR
FROM 
    cte;

--Q 10. Estimate the revenue growth rate of 4-wheeler and 2-wheelers EVs in India for 2022 vs 2024 and 2023 vs 2024, assuming an average unit price. 

--2022 vs 2024, 2 wheelers

with cte as (
select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_22
from ev_sales_makers
where datepart(year,date) = '2022' and  vehicle_category = '2-wheelers'
group by vehicle_category, datepart(year,date))

, cte1 as (select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_24
from ev_sales_makers
where datepart(year,date) = '2024' and  vehicle_category = '2-wheelers'
group by vehicle_category, datepart(year,date))

select (((select total_revenue_24 from cte1) - (select total_revenue_22 from cte))*100.0/(select total_revenue_22 from cte)) as growth_rate_22_vs_24_2_wheeelers;


--2022 vs 2024, 4 wheelers

with cte as (
select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_22
from ev_sales_makers
where datepart(year,date) = '2022' and  vehicle_category = '4-wheelers'
group by vehicle_category, datepart(year,date))

, cte1 as (select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_24
from ev_sales_makers
where datepart(year,date) = '2024' and  vehicle_category = '4-wheelers'
group by vehicle_category, datepart(year,date))

select (((select total_revenue_24 from cte1) - (select total_revenue_22 from cte))*100.0/(select total_revenue_22 from cte)) as growth_rate_22_vs_24_4_wheeelers

--2023 vs 2024, 2 wheelers

with cte as (
select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_23
from ev_sales_makers
where datepart(year,date) = '2023' and  vehicle_category = '2-wheelers'
group by vehicle_category, datepart(year,date))

, cte1 as (select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_24
from ev_sales_makers
where datepart(year,date) = '2024' and  vehicle_category = '2-wheelers'
group by vehicle_category, datepart(year,date))

select (((select total_revenue_24 from cte1) - (select total_revenue_23 from cte))*100.0/(select total_revenue_23 from cte)) as growth_rate_23_vs_24_2_wheeelers;

--2023 vs 2024 , 4 wheelers

with cte as (
select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_23
from ev_sales_makers
where datepart(year,date) = '2023' and  vehicle_category = '4-wheelers'
group by vehicle_category, datepart(year,date))

, cte1 as (select cast(sum(electric_vehicles_sold) as bigint)*85000 as total_revenue_24
from ev_sales_makers
where datepart(year,date) = '2024' and  vehicle_category = '4-wheelers'
group by vehicle_category, datepart(year,date))

select (((select total_revenue_24 from cte1) - (select total_revenue_23 from cte))*100.0/(select total_revenue_23 from cte)) as growth_rate_23_vs_24_4_wheeelers;
 
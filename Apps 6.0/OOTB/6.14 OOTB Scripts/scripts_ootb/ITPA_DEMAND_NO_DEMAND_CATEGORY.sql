select demand_state,
demand_status,

case when (sum(no_of_demands)=0 and sum(no_of_fulfilled_demand+no_of_pending_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand+no_of_pending_demands)*100)/sum(no_of_demands)),1) end , '9,999,999,990D9')),'%') 
end as conversion_ratio,

case when round(sum(financial_return),0) <0
then '($'||(cast((coalesce((round(sum(financial_return),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(financial_return),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(financial_return)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(financial_return)),0), '9,999,999,999')))) end financial_return, 

case when (sum(no_of_fulfilled_demand)=0 and sum(no_of_fulfilled_demand+no_of_pending_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_fulfilled_demand+no_of_pending_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand)*100)/sum(no_of_fulfilled_demand+no_of_pending_demands)),1) end , '9,999,999,990D9')),'%') 
end as fulfilled_to_approved_ratio,

case when (sum(no_of_fulfilled_demand)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demand)*100)/sum(no_of_demands)),1) end , '9,999,999,990D9')),'%') end as fulfillment_ratio,
sum(no_of_demands) as no_of_demands, sum(no_of_fulfilled_demand) as no_of_fulfilled_demand,
sum(no_of_pending_demands) as no_of_pending_demands, 

case when round(sum(planned_cost),0) <0
then '($'||(cast((coalesce((round(sum(planned_cost),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_cost),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_cost)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_cost)),0), '9,999,999,999')))) end planned_cost, 

case when round(sum(planned_financial_benifit),0) <0
then '($'||(cast((coalesce((round(sum(planned_financial_benifit),0)*(-1)),0)) as varchar(200)))||')'
when round(sum(planned_financial_benifit),0) >=1000
then concat('$',concat(trim(to_char(coalesce(round((sum(planned_financial_benifit)/1000),0),0), '9,999,999,999')),'K')) 
else concat('$',(trim(to_char(coalesce(round(sum(planned_financial_benifit)),0), '9,999,999,999')))) end planned_financial_benifit

from #DWH_TABLE_SCHEMA.temp_demand_icube
group by demand_state,demand_status
order by UPPER(demand_state),UPPER(demand_status)
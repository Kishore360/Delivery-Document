select 
demand_status,

case when (sum(no_of_fulfilled_demands_within_budget)=0 and sum(no_of_fulfilled_demands)=0) then ''
else concat(trim(to_char(case when sum(no_of_fulfilled_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demands_within_budget)*100)/sum(no_of_fulfilled_demands)),1)end
,'9,999,999,990D9')),'%')end as fulfilled_demand_in_planned_budget_pect,

case when (sum(no_of_fulfilled_demands_within_time)=0 and sum(no_of_fulfilled_demands)=0) then ''
else 
concat(trim(to_char(case when sum(no_of_fulfilled_demands)=0 then 0 else
round(((sum(no_of_fulfilled_demands_within_time)*100)/sum(no_of_fulfilled_demands)),1)end
,'9,999,999,990D9')),'%')end as fulfilled_demand_in_planned_time_pect,

case when (sum(no_of_p1_demands)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_p1_demands)*100)/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%')end 
as p1_demands_pect,

case when (sum(no_of_unapproved_demands)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_unapproved_demands)*(100.0))/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%')end 
as unapproved_demand_pect,

case when (sum(no_of_approval_compliance_demands)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_approval_compliance_demands)*100)/sum(no_of_demands)),1) end
,'9,999,999,990D9')),'%') end as approval_compliance_pect,

case when (sum(no_of_approved_demands)=0 and sum(no_of_demands)=0) then null
else 
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_approved_demands)*100)/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%')
end as approved_demand_ratio,

round(sum(demand_approval_delay)*(1.0),1) as demand_approval_delay,

round(sum(demand_approval_time)*(1.0),1) as demand_approval_time,

case when (sum(demand_approval_time)=0 and (sum(no_of_approved_demands)+sum(no_of_converted_demands))=0) then null
else
concat(trim(to_char(case when (sum(no_of_approved_demands)+sum(no_of_converted_demands))=0 then 0 else
round(((sum(demand_approval_time))/(sum(no_of_approved_demands)+sum(no_of_converted_demands))),1)end
,'9,999,999,990D9')),'')end as mean_demand_approval_time,

sum(no_of_approval_compliance_demands) as no_of_approval_compliance_demands,

sum(no_of_approved_demands) as no_of_approved_demands,
sum(no_of_cancelled_demands) as no_of_cancelled_demands,
sum(no_of_converted_demands) as no_of_converted_demands,
count(no_of_demands) as no_of_demands,
sum(no_of_fulfilled_demands) as no_of_fulfilled_demands,
sum(no_of_fulfilled_demands_within_budget) as no_of_fulfilled_demands_within_budget,
sum(no_of_fulfilled_demands_within_time) as no_of_fulfilled_demands_within_time,
sum(no_of_new_demands) as no_of_new_demands,
sum(no_of_p1_approved_demands) as no_of_p1_approved_demands,
sum(no_of_p1_demands) as no_of_p1_demands,
sum(no_of_p1_fulfilled_demands) as no_of_p1_fulfilled_demands,
sum(no_of_p1_pending_demands) as no_of_p1_pending_demands,
sum(no_of_p2_pending_demands) as no_of_p2_pending_demands,
sum(no_of_pending_demands) as no_of_pending_demands,
sum(no_of_project_demands) as no_of_project_demands,
sum(no_of_rejected_demands) as no_of_rejected_demands,

case when (sum(no_of_p1_approved_demands)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_p1_approved_demands)*100)/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%')end as p1_approved_demand_ratio,

case when (sum(no_of_p1_fulfilled_demands)=0 and sum(no_of_demands)=0) then null
else
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_p1_fulfilled_demands)*100)/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%')end as p1_demand_fulfillment_ratio,

case when (sum(no_of_pending_demands)=0 and sum(no_of_demands)=0) then null
else 
concat(trim(to_char(case when sum(no_of_demands)=0 then 0 else
round(((sum(no_of_pending_demands)*(100.0))/sum(no_of_demands)),1) end,'9,999,999,990D9')),'%') end
as pending_demand_ratio

from #DWH_TABLE_SCHEMA.temp_demand_icube

group by demand_status

order by LOWER(demand_status)
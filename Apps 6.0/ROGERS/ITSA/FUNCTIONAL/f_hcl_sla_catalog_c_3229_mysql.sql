SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1) cnt from
(select sla,month_start_date_key xy1,(attained_availability)attained_availability
from   rogers6_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers6_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='3.3.29' and d.hcl_schedule_ac_attachment_ref ='Availability' )a1
left join 
(


select yz,SUM(ABC),SUM(DEF),((SUM(ABC)-SUM(DEF))/(SUM(ABC)))*100.00 attained_availability
from (
select  d32.month_start_date_key yz,sum(f2.available_duration*ta.number_of_days) ABC,sum(incident_duration)   DEF
from  rogers6_mdwdb.f_incident f 
join rogers6_mdwdb.d_incident  d23 on f.incident_key=d23.row_key
join  rogers6_mdwdb.f_problem d on d.problem_key=f.problem_key 
-- join rogers6_mdwdb.f_outage f1 on d.problem_key=f1.problem_key -- *

join rogers6_mdwdb.f_application_availability_c f2 on d.configuration_item_key=f2.configuration_item_key

join  rogers6_mdwdb.d_problem d21 on d21.row_key=d.problem_key
join rogers6_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key -- *
left join rogers6_mdwdb.d_internal_organization d11 on d.assignment_group_for_pit_lead_c_key=d11.row_key
join rogers6_mdwdb.d_lov fl on d.priority_src_key=fl.row_key 
join rogers6_mdwdb.d_lov g on d21.sub_status_src_c_key=g.row_key 
join rogers6_mdwdb.d_configuration_item dc on d.configuration_item_key=dc.row_key 
join rogers6_mdwdb.f_incident_duration_c fdc on fdc.incident_key=f.incident_key -- *
  join (select distinct substring(month_end_date_key,7,2) as number_of_days,month_name,month_start_date_key ,lagging_count_of_month from rogers6_mdwdb.d_calendar_date where lagging_count_of_month between 0 and 11) ta 
 on d32.month_start_date_key=ta.month_start_date_key
where dc.environment_c in ('Development','Test','QA')  and component_criticality_c='Productivity'   and dc.subcategory in ('Windows Server','Linus Server')  
   and d11.organization_name like '%HCL%' 
and fl.dimension_name in ('Priority 1','Priority 2')
and g.dimension_name not in ('Cancelled','Disqualified','UNSPECIFIED')   
and d32.lagging_count_of_month between 0 and 11
)a
group by yz


)b on b.yz=a1.xy1 where a1.attained_availability<>b.attained_availability) c
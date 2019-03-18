SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message 
-- select xy1,b2.month_start_date_key,attained_response_and_resolution,cnt
FROM (
select sla,month_start_date_key xy1,
-- RIGHT(d.row_id,8) xy1,
(attained_response_and_resolution)attained_response_and_resolution
-- ,tier,services,hcl_schedule_ac_attachment_ref,metric,measurement_window,agreed_minimum,agreed_minimum_formatted_c,agreed_expected,agreed_expected_formatted_c ,csi_eligible,
-- weighting_factor,reference,rag
from   rogers_mdwdb.d_hcl_sla_catalog_c  d 
join     rogers_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla in ('1.5.17')
)a
right join
(
select a.month_start_date_key month_start_date_key,(a.cnt/b.cnt)*100.0 cnt from 
( select  month_start_date_key,count(1)cnt from      rogers_mdsdb.incident_final b
join    rogers_mdsdb.task_sla_final a on a.task=b.sys_id 
join rogers_mdsdb.contract_sla_final b34 on a.sla=b34.sys_id
join   rogers_mdwdb.f_incident f on b.sys_id=f.row_id 
join rogers_mdwdb.d_problem d12 on f.problem_key=d12.row_key
join rogers_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers_mdwdb.d_internal_organization d11 on d12.assignment_group_for_pit_lead_c_key=d11.row_key 
where 
has_breached=0 and 
d11.organization_name like '%HCL%' and lagging_count_of_month between 0 and 11 and   
b34.name='Rogers Priority 2 - Response' 
and u_sub_status not in ('Cancelled','Out Of Scope') 
group by 1 )a
cross join 
( select  month_start_date_key month_start_date_key,count(1)cnt from      rogers_mdsdb.incident_final b
join    rogers_mdsdb.task_sla_final a on a.task=b.sys_id 
join rogers_mdsdb.contract_sla_final b34 on a.sla=b34.sys_id
join   rogers_mdwdb.f_incident f on b.sys_id=f.row_id 
join rogers_mdwdb.d_problem d12 on f.problem_key=d12.row_key
join rogers_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers_mdwdb.d_internal_organization d11 on d12.assignment_group_for_pit_lead_c_key=d11.row_key 
where month_start_date_key>='20180101' and 
d11.organization_name like '%HCL%' and lagging_count_of_month between 0 and 11 and   
b34.name='Rogers Priority 2 - Response' 
and u_sub_status not in ('Cancelled','Out Of Scope') 
group by 1)b on a.month_start_date_key=b.month_start_date_key   )b2  on a.xy1=b2.month_start_date_key
where coalesce(attained_response_and_resolution,0)<>cnt;
 
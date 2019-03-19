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
where sla in ('3.5.45')
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
left join rogers_mdwdb.d_lov l on secondary_closure_code_src_c_key=l.row_key
left join rogers_mdwdb.d_lov l on primary_closure_code_src_c_key=l.row_key

where 
b.priority in (1,2) and 
d11.organization_name like '%HCL%' and 
b34.name='Rogers Priority 5 - Resolution' 
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
left join rogers_mdwdb.d_internal_organization d112 on f.assignment_group_key=d112.row_key 
where month_start_date_key>='20180101' and  b.priority in (1,2)
group by 1)b on a.month_start_date_key=b.month_start_date_key   )b2  on a.xy1=b2.month_start_date_key
where coalesce(attained_response_and_resolution,0)<>cnt;




select dcal.row_key as row_key,calendar_date,start_date_time_c ,end_date_time_c,month_start_date_key,critical_day_c_flag from rogers_mdsdb.cmn_schedule_span_final p 
LEFT JOIN rogers_mdsdb.cmn_schedule_blackout_final s on p.schedule=s.sys_id 
left join rogers_mdwdb.d_schedule_span_c d  on d.row_id=p.sys_id 
join rogers_mdwdb.d_calendar_date dcal on dcal.calendar_date between date(d.start_date_time_c) and date(d.end_date_time_c)
 and (extract(year from calendar_date) = extract(year from d.start_date_time_c) or
 extract(year from calendar_date) = extract(year from d.end_date_time_c)) where critical_day_c_flag='Y'
 
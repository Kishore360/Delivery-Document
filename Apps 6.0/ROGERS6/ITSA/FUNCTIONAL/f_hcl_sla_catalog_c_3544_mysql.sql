SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message 
-- select xy1,b2.month_start_date_key,attained_response_and_resolution,cnt
FROM (
select count(1) cnt from
(
select sla,month_start_date_key xy1,
-- RIGHT(d.row_id,8) xy1,
(attained_response_and_resolution)attained_response_and_resolution
-- ,tier,services,hcl_schedule_ac_attachment_ref,metric,measurement_window,agreed_minimum,agreed_minimum_formatted_c,agreed_expected,agreed_expected_formatted_c ,csi_eligible,
-- weighting_factor,reference,rag
from   rogers6_mdwdb.d_hcl_sla_catalog_c  d 
join     rogers6_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla in ('3.5.44')
)a
right join
(
select a.month_start_date_key month_start_date_key,(a.cnt/b.cnt)*100.0 cnt from 
( select  month_start_date_key,count(1) cnt,b.cdctype from      rogers6_mdsdb.incident_final b
join    rogers6_mdsdb.task_sla_final a on a.task=b.sys_id 
join rogers6_mdsdb.contract_sla_final b34 on a.sla=b34.sys_id
join   rogers6_mdwdb.f_incident f on b.sys_id=f.row_id 
join rogers6_mdwdb.d_problem d12 on f.problem_key=d12.row_key
join rogers6_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers6_mdwdb.d_lov lov on f.priority_src_key=lov.row_key
left join rogers6_mdwdb.d_internal_organization d112 on f.resolved_by_group_key=d112.row_key 
where 
dimension_name in ('priority 1','priority 2') and 
d112.organization_name like '%HCL%' and 
b34.name='Rogers-Vital App-Password-Resolution' 
and u_sub_status not in ('Cancelled') 
and b.CDCTYPE='X' and a.CDCTYPE='X' and b34.CDCTYPE='X' and d12.soft_deleted_flag='N' and d32.soft_deleted_flag='N' and lov.soft_deleted_flag='N' 
and d112.soft_deleted_flag='N'
group by 1 )a
cross join 
( select  month_start_date_key month_start_date_key,b.cdctype,count(1) cnt from      rogers6_mdsdb.incident_final b
join    rogers6_mdsdb.task_sla_final a on a.task=b.sys_id 
join rogers6_mdsdb.contract_sla_final b34 on a.sla=b34.sys_id
join   rogers6_mdwdb.f_incident f on b.sys_id=f.row_id 
join rogers6_mdwdb.d_problem d12 on f.problem_key=d12.row_key
join rogers6_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers6_mdwdb.d_lov lov on f.priority_src_key=lov.row_key
left join rogers6_mdwdb.d_internal_organization d112 on f.resolved_by_group_key=d112.row_key 
where month_start_date_key>='20180101' and dimension_name in ('priority 1','priority 2') and 
d112.organization_name like '%HCL%' and 
b34.name='Rogers-Vital App-Password-Resolution' 
and u_sub_status not in ('Cancelled') 
and b.CDCTYPE='X' and a.CDCTYPE='X' and b34.CDCTYPE='X' and d12.soft_deleted_flag='N' and d32.soft_deleted_flag='N' and lov.soft_deleted_flag='N' 
and d112.soft_deleted_flag='N'
group by 1)b on a.month_start_date_key=b.month_start_date_key   )b2  on a.xy1=b2.month_start_date_key
where coalesce(attained_response_and_resolution,0)<>cnt
)a;
 

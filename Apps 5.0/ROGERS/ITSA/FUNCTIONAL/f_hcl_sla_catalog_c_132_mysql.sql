SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select a.*,yz  ,cast(coalesce((((tot_days_month*available_duration)-b.incident_duration )/(tot_days_month*available_duration))*100.0000,100.00) as decimal(10,2)) as expected from 
(
select month_start_date_key xy1,
-- RIGHT(d.row_id,8) xy1,
(attained_availability)attained_availability
-- ,tier,services,hcl_schedule_ac_attachment_ref,metric,measurement_window,agreed_minimum,agreed_minimum_formatted_c,agreed_expected,agreed_expected_formatted_c ,csi_eligible,
-- weighting_factor,reference,rag
from   rogers_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='1.3.2')a
join 
(select distinct month_start_date_key,month_end_date_key, substring(month_end_date_key,7,2) as tot_days_month from rogers_mdwdb.d_calendar_date )c 
on a.xy1=c.month_start_date_key
left join 
(
select  month_start_date_key yz,f2.available_duration,f2.incident_duration  incident_duration 
from  rogers_mdwdb.f_incident f 
join rogers_mdwdb.d_incident  d23 on f.incident_key=d23.row_key
join  rogers_mdwdb.f_problem d on d.problem_key=f.problem_key
join rogers_mdwdb.f_outage f1 on d.problem_key=f1.problem_key
join rogers_mdwdb.d_application  d1 on f1.application_key=d1.row_key
join rogers_mdwdb.f_application_availability_c f2 on f2.outage_key=f1.outage_key
join  rogers_mdwdb.d_problem d21 on d21.row_key=d.problem_key
join rogers_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers_mdwdb.d_internal_organization d11 on d.assignment_group_for_pit_lead_c_key=d11.row_key
join rogersdev_mdwdb.d_configuration_item dc on d.configuration_item_key=dc.row_key 
join rogersdev_mdwdb.f_incident_duration_c fdc on fdc.incident_key=f.incident_key
where d1.component_criticality_c='vital'  and dc.subcategory in ('Windows Server','Linux server') and 
   d11.organization_name like '%HCL%'
and d.priority_src_key in ('17930','17931')
and d21.sub_status_src_c_key not in ('34184','34185')
-- group by month_start_date_key
)b on xy1=yz
where cast(attained_availability as decimal(10,2))<>
 cast(coalesce((((tot_days_month*available_duration)-b.incident_duration )/(tot_days_month*available_duration))*100.0000,100.00) as decimal(10,2)) 
)b1;
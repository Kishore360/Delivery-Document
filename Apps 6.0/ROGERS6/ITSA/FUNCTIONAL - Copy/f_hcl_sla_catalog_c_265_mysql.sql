SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (select count(1) cnt from (
select a.*,yz  ,cast(coalesce((((tot_days_month*available_duration)-b.outage_duration)/(tot_days_month*available_duration))*100.0000,100.00) as decimal(10,2)) as expected from 
(
select month_start_date_key xy1,
-- RIGHT(d.row_id,8) xy1,
(attained_vital_application)attained_vital_application
-- ,tier,services,hcl_schedule_ac_attachment_ref,metric,measurement_window,agreed_minimum,agreed_minimum_formatted_c,agreed_expected,agreed_expected_formatted_c ,csi_eligible,
-- weighting_factor,reference,rag
from   rogers_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='2.6.5')a
join 
(select distinct month_start_date_key,month_end_date_key, substring(month_end_date_key,7,2) as tot_days_month from rogers_mdwdb.d_calendar_date )c 
on a.xy1=c.month_start_date_key
left join 
(
select  month_start_date_key yz,available_duration,f2.outage_duration outage_duration
from  rogers_mdwdb.f_incident f 
join rogers_mdwdb.d_incident  d23 on f.incident_key=d23.row_key
join rogers_mdwdb.f_outage f1 on f.incident_key=f1.incident_key
join rogers_mdwdb.d_application  d1 on f1.application_key=d1.row_key
join rogers_mdwdb.f_application_availability_c f2 on f2.outage_key=f1.outage_key
join  rogers_mdwdb.f_problem d on d.problem_key=f.problem_key
join rogers_mdwdb.d_calendar_date d32 on f.opened_on_key=d32.row_key
left join rogers_mdwdb.d_internal_organization d11 on d.assignment_group_for_pit_lead_c_key=d11.row_key 
where  name in (0183) and
   d11.organization_name like '%HCL%'
and f.priority_src_key in ('17921','17922')
and d23.sub_status_src_c_key not in ('34151',34156)
-- group by month_start_date_key
)b on xy1=yz
where cast(attained_vital_application as decimal(10,2))<>
 cast(coalesce((((tot_days_month*available_duration)-b.outage_duration)/(tot_days_month*available_duration))*100.0000,100.00) as decimal(10,2)) 
)a)b1;
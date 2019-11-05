SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0 
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1) cnt from
(
select a1.*,b1.msd,b1.attained_Governance from 
(select sla,month_start_date_key xy1,(attained_Governance)attained_Governance1
from   rogers6_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers6_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='1.1.1' and d.hcl_schedule_ac_attachment_ref ='Governance' )a1
right join 
(

select  d32.month_start_date_key msd,sum(rca_business_days_c/86400.0),case when sum(rca_business_days_c/86400.0) >=0 and sum(rca_business_days_c/86400.0) <5 then 5
when sum(rca_business_days_c/86400.0) >=5 and sum(rca_business_days_c/86400.0) <10 then 5.1
when sum(rca_business_days_c/86400.0) >=10 then 5.2 end
 attained_Governance
from  rogers6_mdwdb.f_problem d 
-- join rogers6_mdwdb.f_application_availability_c f2 on d.configuration_item_key=f2.configuration_item_key
join  rogers6_mdwdb.d_problem d21 on d21.row_key=d.problem_key
join rogers6_mdwdb.d_calendar_date d32 on date_format(u_root_cause_identified_c,'%Y%m%d')=d32.row_key 
left join rogers6_mdwdb.d_internal_organization d11 on d.assignment_group_for_pit_lead_c_key=d11.row_key
join rogers6_mdwdb.d_lov fl on d.priority_src_key=fl.row_key 
join rogers6_mdwdb.d_lov g on d21.sub_status_src_c_key=g.row_key 
where  d11.organization_name like '%HCL%' 
and fl.dimension_name in ('Priority 1','Priority 2')
and g.dimension_name not in ('Cancelled','Disqualified','UNSPECIFIED')   
and d32.lagging_count_of_month between 0 and 11

group by 1
)b1 on a1.xy1=b1.msd  where a1.attained_Governance1<>b1.attained_Governance)b)c
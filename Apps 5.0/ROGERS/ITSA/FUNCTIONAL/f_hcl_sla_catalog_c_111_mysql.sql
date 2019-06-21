SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0 
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1) cnt from
(
select a1.*,b1.msd,b1.attained_Governance from 
(select sla,month_start_date_key xy1,(attained_Governance)attained_Governance1
from   rogers_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='1.1.1' and d.hcl_schedule_ac_attachment_ref ='Governance' )a1
right join 
(

select a.mcd mcd,(a.abc/a1.def)*100.0 from 
(select  d32.month_start_date_key msd,count(1) abc
from  rogers_mdwdb.f_problem_task f2 
join rogers_mdwdb.d_problem_task d2 on f2.problem_task_key=d2.row_key
join rogers_mdwdb.d_calendar_date d32 on f2.closed_on_key=d32.row_key 
left join rogers_mdwdb.d_internal_organization d11 on f2.assignment_group_key=d11.row_key
where  d11.organization_name like '%HCL%' and d2.closed_on<=d2.due_on 
and d32.lagging_count_of_month between 0 and 11
group by 1)a
cross join 
(select  d32.month_start_date_key msd,count(1) abc
from  rogers_mdwdb.f_problem_task f2 
join rogers_mdwdb.d_problem_task d2 on f2.problem_task_key=d2.row_key
join rogers_mdwdb.d_calendar_date d32 on f2.closed_on_key=d32.row_key 
left join rogers_mdwdb.d_internal_organization d11 on f2.assignment_group_key=d11.row_key
where  d11.organization_name like '%HCL%' 
and d32.lagging_count_of_month between 0 and 11
group by 1)a1 
on a.msd=a1.msd

)b1 on a1.xy1=b1.msd  where a1.attained_Governance1<>b1.attained_Governance)b)c
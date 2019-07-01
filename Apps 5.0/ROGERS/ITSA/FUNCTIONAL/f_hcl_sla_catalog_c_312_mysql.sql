SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1) cnt from
(select sla,month_start_date_key msd,(attained_availability)attained_availability
from   rogers_mdwdb.d_hcl_sla_catalog_c  d 
join    rogers_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='3.1.2')a
right join
(

select a.msd msd,(abc/def)*100.0 attained_availability from 
(select month_start_date_key msd,count(1)abc  -- distinct f.survey_key,f.survey_wizard_c_key,d.survey_wizard_c_key,question_key,response_value,task_type,name,
-- question_key,response,response_value,question
 from rogers_mdwdb.f_task_survey f
join rogers_mdwdb.f_incident f11 on f.incident_key=f11.incident_key
join rogers_mdwdb.d_survey_instance d on f.survey_instance_key=d.row_key
join rogers_mdwdb.d_survey_wizard_c dw on d.survey_wizard_c_key=dw.row_key
join rogers_mdwdb.f_response fr on f.survey_instance_key=fr.survey_instance_key
join rogers_mdwdb.d_survey_question dq on fr.question_key=dq.row_key
join rogers_mdwdb.d_calendar_date d32 on f11.opened_on_key=d32.row_key 
left join rogers_mdwdb.d_internal_organization d11 on assignment_group_key=d11.row_key
join rogers_mdwdb.d_lov fl on priority_src_key=fl.row_key 
where dq.row_id in ('8281aeea7c35a8006216b82ff00beae0','065615c27cc5e0006216b82ff00beac2') 
and task_type='incident' and  d11.organization_name like '%HCL%' and d32.lagging_count_of_month between 0 and 11
and fl.dimension_name in ('Priority 4','Priority 5') and response in (1,2)
)a
cross join 
(select month_start_date_key msd,count(1)def-- distinct f.survey_key,f.survey_wizard_c_key,d.survey_wizard_c_key,question_key,response_value,task_type,name,
-- question_key,response,response_value,question 
from rogers_mdwdb.f_task_survey f
join rogers_mdwdb.f_incident f11 on f.incident_key=f11.incident_key
join rogers_mdwdb.d_survey_instance d on f.survey_instance_key=d.row_key
join rogers_mdwdb.d_survey_wizard_c dw on d.survey_wizard_c_key=dw.row_key
join rogers_mdwdb.f_response fr on f.survey_instance_key=fr.survey_instance_key
join rogers_mdwdb.d_survey_question dq on fr.question_key=dq.row_key
join rogers_mdwdb.d_calendar_date d32 on f11.opened_on_key=d32.row_key 
left join rogers_mdwdb.d_internal_organization d11 on assignment_group_key=d11.row_key
join rogers_mdwdb.d_lov fl on priority_src_key=fl.row_key 
where dq.row_id in ('8281aeea7c35a8006216b82ff00beae0','065615c27cc5e0006216b82ff00beac2') 
and task_type='incident' and  d11.organization_name like '%HCL%' and d32.lagging_count_of_month between 0 and 11
and fl.dimension_name in ('Priority 4','Priority 5') -- and response in (1,2)
)a1 on a.msd=a1.msd
group by msd

)b on  b.msd=a.msd where a.attained_availability<>b.attained_availability) c
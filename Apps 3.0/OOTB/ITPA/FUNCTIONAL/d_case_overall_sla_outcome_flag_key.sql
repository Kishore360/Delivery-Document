SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.overall_sla_outcome_flag ' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_case D
left join 
(
select f.case_key, f.task_type, d.sla_category, f.start_on, 
(case when LOV.dimension_code in ('in_progress', 'paused') then 'IN_PROGRESS'
when LOV.dimension_code in ('breached') then 'BREACHED'
when LOV.dimension_code in ('achieved', 'completed') then 'ACHIEVED'
when LOV.dimension_code is null then 'NOT_APPLICABLE' end) DIM_CDE
from <<tenant>>_mdwdb.f_task_sla f
left join <<tenant>>_mdwdb.d_task_sla d
on d.row_key=f.sla_key and f.task_type='SN_CUSTOMERSERVICE_CASE'
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_key = f.stage_src_key
left join 
(select max(f.start_on) strt, f.case_key inc
from <<tenant>>_mdwdb.f_task_sla f
left join <<tenant>>_mdwdb.d_task_sla d
on d.row_key=f.sla_key and f.task_type='SN_CUSTOMERSERVICE_CASE'
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_key = f.stage_src_key
where d.sla_category in ('Resolution', 'Response') and f.stage_src_key is not null and LOV.dimension_code not in ('cancelled')
group by f.case_key
) SQ
on SQ.inc = f.case_key
where f.task_type='SN_CUSTOMERSERVICE_CASE' and SQ.strt = f.start_on and f.stage_src_key is not null and LOV.dimension_code not in ('cancelled')
group by f.case_key, f.task_type, d.sla_category, f.start_on
)task
on task.case_key = D.row_key and task.task_type = 'SN_CUSTOMERSERVICE_CASE'
left join <<tenant>>_mdwdb.d_lov LOV
on D.overall_sla_outcome_flag_key = LOV.row_key
where D.row_key not in (0,-1) and task.sla_category in ('Resolution', 'Response') and
COALESCE(LOV.dimension_name,'')  <> COALESCE(task.DIM_CDE,'NOT_APPLICABLE') ;

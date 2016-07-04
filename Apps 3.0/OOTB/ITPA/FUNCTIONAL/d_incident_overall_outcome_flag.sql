SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.overall_sla_outcome_flag ' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_incident D
left join 
(
select f.incident_key, f.task_type, d.sla_category, f.start_on, 
max(case when LOV.dimension_code in ('in_progress', 'paused') then 'IN_PROGRESS'
when LOV.dimension_code in ('breached') then 'BREACHED'
when LOV.dimension_code in ('achieved', 'completed') then 'ACHIEVED'
when LOV.dimension_code is null then 'NOT_APPLICABLE' end) DIM_CDE
from <<tenant>>_mdwdb.f_task_sla f
left join <<tenant>>_mdwdb.d_task_sla d
on d.row_key=f.sla_key and f.task_type='incident'
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_key = f.stage_src_key
left join 
(select max(f.start_on) strt, f.incident_key inc
from <<tenant>>_mdwdb.f_task_sla f
left join appsitsa2_mdwdb.d_task_sla d
on d.row_key=f.sla_key and f.task_type='incident'
where d.sla_category in ('Resolution', 'Response') and f.stage_src_key is not null and f.stage_src_key <> 686
group by f.incident_key
) SQ
on SQ.inc = f.incident_key
where f.task_type='incident' and SQ.strt = f.start_on and f.stage_src_key is not null and f.stage_src_key <> 686
group by f.incident_key, f.task_type, d.sla_category, f.start_on
)task
on task.incident_key = D.row_key and task.task_type = 'incident'
left join <<tenant>>_mdwdb.d_lov LOV
on D.overall_sla_outcome_flag = LOV.dimension_code
where D.row_key not in (0,-1) and task.sla_category in ('Resolution', 'Response') and
COALESCE(LOV.dimension_name,'')  <> COALESCE(task.DIM_CDE,'NOT_APPLICABLE') ;

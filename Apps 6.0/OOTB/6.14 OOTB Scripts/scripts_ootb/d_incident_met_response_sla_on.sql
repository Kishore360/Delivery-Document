select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.met_response_sla_on' ELSE 'SUCCESS' END as Message

/*select TRGT.row_key, SQ.category, inc_state.dimension_wh_code, SQ.stage, SQ.outcome_flag, 
TRGT.met_resolution_sla_flag_key tr,
(case when inc_state.dimension_wh_code in ('RESOLVED','CLOSED') and SQ.outcome_flag = 'Y' then 'WH_SLA_FLAG~TASK_SLA~N'
when inc_state.dimension_wh_code in ('RESOLVED','CLOSED') and SQ.outcome_flag = 'N' then 'WH_SLA_FLAG~TASK_SLA~Y'
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED')  and SQ.outcome_flag = 'Y' then 'WH_SLA_FLAG~TASK_SLA~N'
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED') and SQ.stage in ('PAUSED','IN_PROGRESS') then 'WH_SLA_FLAG~TASK_SLA~P'
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED') and SQ.stage in ('COMPLETED','ACHIEVED') then 'WH_SLA_FLAG~TASK_SLA~Y'
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED') and SQ.stage = 'BREACHED' then 'WH_SLA_FLAG~TASK_SLA~N'
else 'WH_SLA_FLAG~TASK_SLA~X' end) as met_response_sla_flag_id,
coalesce(TRGT.met_response_sla_on, '') actual,
case when SQ.stage in ('COMPLETED','ACHIEVED') then coalesce(SQ.start_on, '') else  NULL end expected*/
from #DWH_TABLE_SCHEMA.d_incident TRGT
left join
(
select SLA.incident_key as incident_key,SLA.stage as stage,SLA.category as category,
SLA.start_on as start_on,SLA_latest.outcome_flag as outcome_flag
from  
(
SELECT f_sla.incident_key as incident_key,lov_stage.dimension_wh_code as stage,lov_cat.dimension_wh_code as category,
f_sla.start_on as start_on,f_sla.outcome_flag
FROM #DWH_TABLE_SCHEMA.f_task_sla f_sla
join #DWH_TABLE_SCHEMA.d_lov_map lov_stage on f_sla.stage_src_key = lov_stage.src_key
join #DWH_TABLE_SCHEMA.d_task_sla d_sla 
on d_sla.row_key=f_sla.sla_key 
and d_sla.soft_deleted_flag='N'
join #DWH_TABLE_SCHEMA.d_lov_map lov_cat on d_sla.sla_category_key = lov_cat.src_key
where f_sla.task_type='incident' and
lov_stage.dimension_wh_code <> 'CANCELLED' and lov_cat.dimension_wh_code in ('RESPONSE','RESOLUTION')
) SLA
join 
(
select f_sla.incident_key, lov_cat.dimension_wh_code as category, max(f_sla.start_on) as start_on, max(f_sla.outcome_flag) outcome_flag
FROM #DWH_TABLE_SCHEMA.f_task_sla f_sla
join #DWH_TABLE_SCHEMA.d_lov_map lov_stage on f_sla.stage_src_key = lov_stage.src_key
join #DWH_TABLE_SCHEMA.d_task_sla d_sla 
on d_sla.row_key=f_sla.sla_key 
and d_sla.soft_deleted_flag='N'
join #DWH_TABLE_SCHEMA.d_lov_map lov_cat on d_sla.sla_category_key = lov_cat.src_key
where f_sla.task_type='incident' and
lov_stage.dimension_wh_code <> 'CANCELLED' and lov_cat.dimension_wh_code in ('RESPONSE','RESOLUTION')
group by f_sla.incident_key, lov_cat.dimension_wh_code
) SLA_latest
on SLA.incident_key = SLA_latest.incident_key and SLA.category = SLA_latest.category and SLA.start_on = SLA_latest.start_on
) SQ
on SQ.incident_key = TRGT.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map inc_state
on TRGT.state_src_key=inc_state.src_key
left join #DWH_TABLE_SCHEMA.d_lov trgt_key
on trgt_key.row_key = TRGT.met_response_sla_flag_key
where SQ.category = 'RESPONSE'
and coalesce(TRGT.met_response_sla_on, '') <> case when SQ.stage in ('COMPLETED','ACHIEVED') then coalesce(SQ.start_on, '') else  NULL end;
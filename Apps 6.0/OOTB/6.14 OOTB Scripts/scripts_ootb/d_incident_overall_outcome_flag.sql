SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.overall_sla_outcome_flag ' ELSE 'SUCCESS' END as Message
/*select TRGT.row_key, TRGT.incident_number, SQ.category, SQ.stage,
inc_state.dimension_wh_code state, SQ.outcome_flag,
TRGT.overall_sla_outcome_flag,
case when inc_state.dimension_wh_code in ('RESOLVED','CLOSED') 
then case when SQ.outcome_flag like '%Y%' then 'N'
          when SQ.outcome_flag not like '%Y%' then 'Y'
          when SQ.outcome_flag = 'N' then 'Y'
          else 'X' end
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED') 
then case when SQ.outcome_flag like '%Y%' then 'N'
          when SQ.stage like '%BREACHED%' then 'N'
          when SQ.stage like '%PAUSED%' or SQ.stage like '%IN PROGRESS%' then 'P'
          when SQ.stage like '%COMPLETED%' THEN 'Y'
          when SQ.stage like '%ACHIEVED%' THEN 'Y'
          else 'X' end
else 'X' end as overall_flag*/
FROM #DWH_TABLE_SCHEMA.d_incident TRGT
left join 
(
select SLA.incident_key as incident_key,group_concat(SLA.stage) as stage, group_concat(SLA.category) as category,
max(SLA.start_on) as start_on,group_concat(SLA_latest.outcome_flag) as outcome_flag
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
group by SLA.incident_key
) SQ
on SQ.incident_key = TRGT.row_key
join #DWH_TABLE_SCHEMA.d_lov_map inc_state
on TRGT.state_src_key=inc_state.src_key
where TRGT.row_key not in (0,-1) and
coalesce(
(case when inc_state.dimension_wh_code in ('RESOLVED','CLOSED') 
then case when SQ.outcome_flag like '%Y%' then 'N'
          when SQ.outcome_flag not like '%Y%' then 'Y'
          when SQ.outcome_flag = 'N' then 'Y'
          else 'X' end
when inc_state.dimension_wh_code not in ('RESOLVED','CLOSED') 
then case when SQ.outcome_flag like '%Y%' then 'N'
          when SQ.stage like '%BREACHED%' then 'N'
          when SQ.stage like '%PAUSED%' or SQ.stage like '%IN PROGRESS%' then 'P'
          when SQ.stage like '%COMPLETED%' THEN 'Y'
          when SQ.stage like '%ACHIEVED%' THEN 'Y'
          ELSE 'X' end
else 'X' end), '') <> coalesce(TRGT.overall_sla_outcome_flag, '');
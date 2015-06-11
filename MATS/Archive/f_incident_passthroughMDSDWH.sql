





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between incident_final and f_incident: passthroughMDSDWH' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.incident_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from  lsm_ls_etl_task_run_history))

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.number,''),
case when S.active = 1 and S.due_date<RH.start_time then 'Y' else 'N' end,
ifnull(S.contact_type,''),
ifnull(S.category,''),
ifnull(substring(S.subcategory,1,80),''),
ifnull(S.state,''),
case when S.reassignment_count>1 then 'Y' else 'N' end,
case when S.reopen_count>0 then 'Y' else 'N' end,
case when S.made_sla = 1 then 'Y' else 'N' end,
case when S.problem_id is not null then 'Y' else 'N' end,
case when S.rfc is not null then 'Y' else 'N' end,
case when S.caused_by is not null then 'Y' else 'N' end,
case when S.knowledge = 1 then 'Y' else 'N' end,
case when S.priority = 1 then 'Y' else 'N' end,
case when timestampdiff(minute,S.opened_at,S.resolved_at)<30 then 'Y' else 'N' end,
case when S.active =1 then 'Y' else 'N' end,
ifnull(S.impact,''),
ifnull(S.urgency,''),
ifnull(S.severity,''),
ifnull(S.priority,''),
ifnull(timestampdiff(second,S.opened_at,S.closed_at),''),
ifnull(timestampdiff(second,S.opened_at,S.resolved_at),''),
ifnull(timestampdiff(second,S.resolved_at,S.closed_at),''),
ifnull(S.reassignment_count,''),
ifnull(S.reopen_count,''),
ifnull(S.time_worked,''))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.incident_number,''),
ifnull(DWH.over_due_flag,''),
ifnull(DWH.reported_type_src_code,''),
ifnull(DWH.category_src_code,''),
ifnull(DWH.sub_category_src_code,''),
ifnull(DWH.state_src_code,''),
ifnull(DWH.multiple_assignment_flag,''),
ifnull(DWH.reopened_flag,''),
ifnull(DWH.met_sla_flag,''),
ifnull(DWH.problem_flag,''),
ifnull(DWH.change_flag,''),
ifnull(DWH.caused_by_change_flag,''),
ifnull(DWH.knowledge_flag,''),
ifnull(DWH.major_incident_flag,''),
ifnull(DWH.first_call_resolution_flag,''),
ifnull(DWH.active_flag,''),
ifnull(DWH.impact_src_code,''),
ifnull(DWH.urgency_src_code,''),
ifnull(DWH.severity_src_code,''),
ifnull(DWH.priority_src_code,''),
ifnull(DWH.open_to_close_duration,''),
ifnull(DWH.open_to_resolve_duration,''),
ifnull(DWH.resolve_to_close_duration,''),
ifnull(DWH.reassignment_count,''),
ifnull(DWH.reopened_count,''),
ifnull(DWH.time_worked,''))
using utf8)) from #TABLE_SCHEMA.f_incident DWH);


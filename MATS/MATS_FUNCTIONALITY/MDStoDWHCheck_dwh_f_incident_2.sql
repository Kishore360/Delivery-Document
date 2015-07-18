
select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between incident_final and dwh_f_incident' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.incident_final S
join <<tenant>>_mdwdb.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join dwh_d_party_view DPV_AT
on (DPV_AT.row_id = concat('INTERNAL_CONTACT~',S.assigned_to) )

left join dwh_d_calendar_date DCD_RES
on (DCD_RES.row_id = date_format(convert_tz(S.resolved_at,source_time_zone,target_time_zone),'%Y%m%d') ) and DCD_RES.source_id=0

left join dwh_d_party_view DPV_RES
on (DPV_RES.row_id = concat('INTERNAL_CONTACT~',S.resolved_by) )

left join dwh_d_calendar_date DCD_CLS
on (DCD_CLS.row_id = date_format(convert_tz(S.closed_at,source_time_zone,target_time_zone),'%Y%m%d') ) and DCD_CLS.source_id=0

left join dwh_d_party_view DPV_CLS
on (DPV_CLS.row_id = concat('INTERNAL_CONTACT~',S.closed_by) )

left join dwh_d_calendar_date DCD_DUE
on (DCD_DUE.row_id = date_format(convert_tz(S.due_date,source_time_zone,target_time_zone),'%Y%m%d') ) and DCD_DUE.source_id = 0

left join <<tenant>>_mdwdb.dwh_t_task_activity TA_PR
on (TA_PR.task_id = S.sys_id 
and TA_PR.source_id = S.sourceinstance 
and TA_PR.task_wh_type = 'incident'
and TA_PR.task_attribute_wh_name = 'priority'
and TA_PR.task_attribute_wh_old_value is not null
and TA_PR.task_attribute_wh_new_value is not null
and TA_PR.task_attribute_wh_new_value < TA_PR.task_attribute_wh_old_value)

left join <<tenant>>_mdwdb.dwh_t_task_activity TA_MC
on (TA_MC.task_id = S.sys_id 
and TA_MC.source_id = S.sourceinstance 
and TA_MC.task_wh_type = 'incident'
and TA_MC.task_attribute_wh_name = 'category'
and TA_MC.task_attribute_wh_old_value is not null 
and TA_MC.task_attribute_wh_new_value is not null
and TA_MC.task_attribute_wh_new_value <> TA_MC.task_attribute_wh_old_value)

join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from  lsm_ls_etl_task_run_history))

where CRC32(concat(
coalesce(DPV_AT.row_key,case when S.assigned_to is not null then -1 else 0 end),
coalesce(DCD_RES.row_key,case when S.resolved_at is not null then -1 else 0 end),
coalesce(DPV_RES.row_key,case when S.resolved_by is not null then -1 else 0 end),
coalesce(DCD_CLS.row_key,case when S.closed_at is not null then -1 else 0 end),
coalesce(DPV_CLS.row_key,case when S.closed_by is not null then -1 else 0 end),
coalesce(DCD_DUE.row_key,case when S.due_date is not null then -1 else 0 end),
case when S.active = 1 and S.due_date<RH.start_time then 'Y' else 'N' end,
ifnull(S.contact_type,''),
ifnull(S.category,''),
ifnull(substring(S.subcategory,1,80),''),
ifnull(S.state,''),
case when S.reassignment_count>1 then 'Y' else 'N' end,
case when S.reopen_count>0 then 'Y' else 'N' end,
case when TA_PR.row_id is not null then 'Y' else 'N' end,
case when S.made_sla = 1 then 'Y' else 'N' end,
case when S.problem_id is not null then 'Y' else 'N' end,
case when S.rfc is not null then 'Y' else 'N' end,
case when S.caused_by is not null then 'Y' else 'N' end,
case when S.knowledge = 1 then 'Y' else 'N' end,
case when TA_MC.row_id is not null then 'Y' else 'N' end,
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
) not in (
select CRC32(concat(
ifnull(DWH.assigned_to_key,''),
ifnull(DWH.last_resolved_on_key,''),
ifnull(DWH.last_resolved_by_key,''),
ifnull(DWH.closed_on_key,''),
ifnull(DWH.closed_by_key,''),
ifnull(DWH.due_on_key,''),
ifnull(DWH.over_due_flag,''),
ifnull(DWH.reported_type_src_code,''),
ifnull(DWH.category_src_code,''),
ifnull(DWH.sub_category_src_code,''),
ifnull(DWH.state_src_code,''),
ifnull(DWH.multiple_assignment_flag,''),
ifnull(DWH.reopened_flag,''),
ifnull(DWH.priority_escalated_flag,''),
ifnull(DWH.met_sla_flag,''),
ifnull(DWH.problem_flag,''),
ifnull(DWH.change_flag,''),
ifnull(DWH.caused_by_change_flag,''),
ifnull(DWH.knowledge_flag,''),
ifnull(DWH.multiple_categorization_flag,''),
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
) from <<tenant>>_mdwdb.dwh_f_incident DWH);

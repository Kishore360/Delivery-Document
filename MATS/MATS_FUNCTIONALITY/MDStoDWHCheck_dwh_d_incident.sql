

select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' END as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed between incident_final and dwh_d_incident' ELSE 'SUCCESS' END AS Message;
select sys_id from <<tenant>>_mdsdb.incident_final S
join <<tenant>>_mdwdb.lsm_ls_source_timezone L
on (S.sourceinstance = L.sourceid )



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

left join <<tenant>>_mdwdb.dwh_d_domain DMN
on (DMN.row_id = S.sys_domain 
and DMN.source_id = (case when S.sys_domain is null then 0 else S.sourceinstance end) ) 

join <<tenant>>_mdwdb.lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from <<tenant>>_mdwdb.lsm_ls_etl_task_run_history))
where CRC32(CONCAT(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.number,''),
ifnull(convert_tz(S.opened_at,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.resolved_at,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.closed_at,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.due_date,source_time_zone,target_time_zone),''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(S.description,''),
ifnull(S.short_description,''),
case when S.active = 1 then 'Y' else 'N' end,
case when S.knowledge = 1 then 'Y' else 'N' end,
case when S.made_sla = 1 then 'Y' else 'N' end,
case when S.active = 1 and S.due_date < RH.start_time then 'Y' else 'N' end,
case when timestampdiff(minute,S.opened_at,S.resolved_at)<30 then 'Y' else 'N' end,
case when reassignment_count > 1 then 'Y' else 'N' end,
case when TA_PR.row_id is not null then 'Y' else 'N' end,
case when TA_MC.row_id is not null then 'Y' else 'N' end,
case when S.reopen_count > 0 then 'Y' else 'N' end,
case when S.problem_id is not null then 'Y' else 'N' end,
case when S.rfc is not null then 'Y' else 'N' end,
case when S.caused_by is not null then 'Y' else 'N' end,
case when S.priority = 1 then 'Y' else 'N' end,
case when S.incident_state not in ('6','7') then 'Y' else 'N' end) 
) not in(
select CRC32(concat( 
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.incident_number,''),
ifnull(DWH.opened_on,''),
ifnull(DWH.last_resolved_on,''),
ifnull(DWH.closed_on,''),
ifnull(DWH.due_on,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.description,''),
ifnull(DWH.short_description,''),
ifnull(DWH.active_flag,''),
ifnull(DWH.knowledge_flag,''),
ifnull(DWH.met_sla_flag,''),
ifnull(DWH.over_due_flag,''),
ifnull(DWH.first_call_resolution_flag,''),
ifnull(DWH.multiple_assignment_flag,''),
ifnull(DWH.priority_escalated_flag,''),
ifnull(DWH.multiple_categorization_flag,''),
ifnull(DWH.reopened_flag,''),
ifnull(DWH.problem_flag,''),
ifnull(DWH.change_flag,''),
ifnull(DWH.caused_by_change_flag,''),
ifnull(DWH.major_incident_flag,''),
ifnull(DWH.backlog_flag,''))
) from <<tenant>>_mdwdb.dwh_d_incident DWH);

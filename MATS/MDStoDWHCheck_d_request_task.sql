


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed between sc_task_final and d_request_task' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.sc_task_final S
join app_test.lsm_ls_source_timezone L 
on (convert(S.sourceinstance using utf8) = convert(L.sourceid using utf8))

left join t_task_activity TA_PR 
on (convert(S.sys_id using utf8) = convert(TA_PR.task_row_id using utf8)
and convert(S.sourceinstance using utf8) = convert(TA_PR.source_id using utf8)
and TA_PR.task_wh_type = 'sc_task'
and TA_PR.task_attribute_wh_name = 'priority'
and TA_PR.task_attribute_wh_old_value is not null
and TA_PR.task_attribute_wh_new_value is not null
and TA_PR.task_attribute_wh_new_value < TA_PR.task_attribute_wh_old_value )

left join t_task_activity TA_MC
on (convert(S.sys_id using utf8) = convert(TA_MC.task_row_id using utf8)
and convert(S.sourceinstance using utf8) = convert(TA_MC.source_id using utf8)
and TA_MC.task_wh_type = 'sc_task'
and TA_MC.task_attribute_wh_name = 'category'
and TA_MC.task_attribute_wh_old_value is not null 
and TA_MC.task_attribute_wh_new_value is not null 
and TA_MC.task_attribute_wh_new_value <> TA_MC.task_attribute_wh_old_value )

left join d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) using utf8))

join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from lsm_ls_etl_task_run_history))
where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.number,''),
ifnull(convert_tz(S.opened_at,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.closed_at,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.due_date,source_time_zone,target_time_zone),''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(S.description,''),
ifnull(S.short_description,''),
ifnull(DMN.row_key,'-1'),
case when S.active = 1 then 'Y' else 'N' end,
case when S.active = 1 and S.due_date < RH.start_time then'Y' else 'N' end,
case when S.made_sla = 1 then 'Y' else 'N' end,
case when S.reassignment_count>1 then 'Y' else 'N' end,
case when TA_PR.row_id is not null then 'Y' else 'N' end,
case when TA_MC.row_id is not null then 'Y' else 'N' end,
case when timestampdiff(minute,S.opened_at,S.closed_at)<30 then 'Y' else 'N' end,
case when S.state <> '3' and S.state  <>  '4' 
and S.state <> '7' then 'Y' else 'N' end
) using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.request_task_number,''),
ifnull(DWH.opened_on,''),
ifnull(DWH.closed_on,''),
ifnull(DWH.due_on,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.description,''),
ifnull(DWH.short_description,''),
ifnull(DWH.domain_key,''),
ifnull(DWH.active_flag,''),
ifnull(DWH.over_due_flag,''),
ifnull(DWH.met_sla_flag,''),
ifnull(DWH.multiple_assignment_flag,''),
ifnull(DWH.priority_escalated_flag,''),
ifnull(DWH.multiple_categorization_flag,''),
ifnull(DWH.first_call_resolution_flag,''),
ifnull(DWH.backlog_flag,'') )
using utf8)) from <<tenant>>_mdwdb.d_request_task DWH);



SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between facilities_final and dwh_d_facilty_request' ELSE 'SUCCESS' END AS Message
FROM <<tenant>>_mdsdb.facilities_final S
JOIN  <<tenant>>_mdwdb.lsm_ls_source_timezone L
ON(S.sourceinstance  =   L.sourceid )


LEFT JOIN dwh_d_domain DMN
ON (DMN.row_id   =  S.location 
AND DMN.source_id  = (CASE WHEN S.sys_domain is NULL THEN 0 ELSE S.sourceinstance END) 
)

LEFT JOIN dwh_t_task_activity TA 
ON ( S.sys_id= TA.task_id  
and S.sourceinstance = TA.source_id 
and TA.task_wh_type = 'sc_request' 
and TA.task_attribute_wh_name ='priority' 
and TA.task_attribute_wh_old_value is not null 
and TA.task_attribute_wh_new_value is not null
and  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value )
join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from  lsm_ls_etl_task_run_history))
WHERE CRC32(CONCAT(
IFNULL(S.sys_id,''),
IFNULL(S.sourceinstance,''),
IFNULL(S.number,''),
IFNULL(convert_tz(S.opened_at,source_time_zone,target_time_zone),''),
IFNULL(convert_tz(S.closed_at,source_time_zone,target_time_zone),''),
IFNULL(convert_tz(S.due_date,source_time_zone,target_time_zone),''),
CASE WHEN S.active = 1 AND S.due_date < RH.start_time then 'Y' else 'N' END,
CASE WHEN TA.row_id IS NOT NULL THEN 'Y' ELSE 'N' END,
CASE WHEN TIMESTAMPDIFF(MINUTE,S.opened_at,S.closed_at)<30 THEN 'Y' ELSE 'N' END,
CASE WHEN S.made_sla =1 then 'Y' else 'N' END,
CASE WHEN S.active =1 then 'Y' else 'N' END,
IFNULL(DMN.row_key,''),
CASE WHEN reassignment_count >1 THEN 'Y' ELSE 'N' END,
IFNULL(S.reassignment_count,''),

IFNULL(S.short_description,''),
IFNULL(S.description,''),
CASE WHEN S.knowledge=1 then 'Y'  else 'N' END,
IFNULL(convert_tz(S.expected_start,source_time_zone,target_time_zone),''),
IFNULL(convert_tz(S.work_start,source_time_zone,target_time_zone),''),
IFNULL(convert_tz(S.work_end,source_time_zone,target_time_zone),''),
IFNULL(S.room_number,''),
IFNULL(S.building,''),
CASE WHEN S.state <> 'closed_rejected' AND S.state  <>  'closed_cancelled' 
AND S.state <> 'closed_complete' THEN 'Y' ELSE 'N' END,
IFNULL(S.sys_created_by,''),
IFNULL(S.sys_updated_by,''),
IFNULL(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
IFNULL(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),'')
)) 
 NOT IN (
SELECT CRC32(CONCAT(
IFNULL(DWH.row_id,''),
IFNULL(DWH.source_id,''),
IFNULL(DWH.facility_request_number,''),
IFNULL(DWH.opened_on,''),
IFNULL(DWH.closed_on,''),
IFNULL(DWH.due_on,''),
IFNULL(DWH.over_due_flag,''),
IFNULL(DWH.priority_escalated_flag,''),
IFNULL(DWH.first_call_resolution_flag,''),
IFNULL(DWH.met_sla_flag,''),
IFNULL(DWH.active_flag,''),
IFNULL(DWH.domain_key,''),
IFNULL(DWH.multiple_assignment_flag,''),
IFNULL(DWH.reassignment_count,''),
IFNULL(DWH.dormant_flag,''),
IFNULL(DWH.short_description,''),
IFNULL(DWH.description,''),
IFNULL(DWH.knowledge_flag,''),
IFNULL(DWH.expected_start,''),
IFNULL(DWH.work_start,''),
IFNULL(DWH.work_end,''),
IFNULL(DWH.room_number,''),
IFNULL(DWH.building,''),
IFNULL(DWH.backlog_flag,''),
IFNULL(DWH.created_by,''),
IFNULL(DWH.changed_by,''),
IFNULL(DWH.created_on,''),
IFNULL(DWH.changed_on,'')
)) FROM <<tenant>>_mdwdb.dwh_d_facility_request DWH)



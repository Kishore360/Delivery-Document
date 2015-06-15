

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from TASK_SLA_final to FS_TASK_SLA did not match' ELSE 'SUCCESS' END AS Message FROM #MDS_TABLE_SCHEMA.task_sla_final S 
JOIN app_test.lsm_ls_source_timezone L

ON(S.sourceinstance= L.sourceid) WHERE CRC32(CONCAT( IFNULL(sys_id,''), IFNULL(sourceinstance,''), IFNULL(task,''), IFNULL(sla,''), IFNULL(convert_tz(start_time,source_time_zone,target_time_zone),''), IFNULL(convert_tz(planned_end_time,source_time_zone,target_time_zone),''), IFNULL(convert_tz(end_time,source_time_zone,target_time_zone),''), IFNULL(stage,''), IFNULL(percentage,''), IFNULL(pause_duration,''), IFNULL(sys_created_by,''), IFNULL(sys_updated_by,''), IFNULL(sys_created_on,''), IFNULL(sys_updated_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(task_row_id,''), IFNULL(sla_id,''), IFNULL(start_on,''), IFNULL(due_on,''), IFNULL(end_on,''), IFNULL(stage_src_code,''), IFNULL(percentage_taken,''), IFNULL(pause_duration,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM #TABLE_SCHEMA.fs_task_sla)

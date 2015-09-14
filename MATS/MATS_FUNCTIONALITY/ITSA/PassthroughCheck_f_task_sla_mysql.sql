


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_TASK_SLA to F_TASK_SLA did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.fs_task_sla WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(task_type,''), IFNULL(stage_src_code_id,''), IFNULL(outcome_flag ,''), IFNULL(actual_duration,''), IFNULL(percentage_taken,''), IFNULL(pause_duration,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(task_type,''), IFNULL(stage_src_code,''), IFNULL(outcome_flag,''), IFNULL(actual_duration,''), IFNULL(percentage_taken,''), IFNULL(pause_duration,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.f_task_sla)

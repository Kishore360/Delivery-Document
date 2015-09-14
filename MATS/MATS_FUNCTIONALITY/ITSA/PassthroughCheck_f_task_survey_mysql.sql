


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_TASK_SURVEY to F_TASK_SURVEY did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.fs_task_survey WHERE CRC32(CONCAT( IFNULL(source_id,''), IFNULL(task_type,''), IFNULL(state,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(source_id,''), IFNULL(task_type,''), IFNULL(state,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.f_task_survey)

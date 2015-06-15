


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from TS_TASK_ACTIVITY to T_TASK_ACTIVITY did not match' ELSE 'SUCCESS' END AS Message FROM #TABLE_SCHEMA.ts_task_activity WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(task_wh_type,''), IFNULL(update_reason,''), IFNULL(update_count,''), IFNULL(task_row_id,''), IFNULL(soft_deleted_flag,''), IFNULL(updated_by,''), IFNULL(created_by,''), IFNULL(created_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(task_wh_type,''), IFNULL(update_reason,''), IFNULL(update_count,''), IFNULL(task_row_id,''), IFNULL(soft_deleted_flag,''), IFNULL(updated_by,''), IFNULL(created_by,''), IFNULL(created_on,''))) FROM #TABLE_SCHEMA.t_task_activity)

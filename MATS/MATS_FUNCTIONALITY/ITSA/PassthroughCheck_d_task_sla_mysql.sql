


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from DS_TASK_SLA to D_TASK_SLA did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.ds_task_sla WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(sla_name,''), IFNULL(sla_condition,''), IFNULL(duration_type,''), IFNULL(sla_duration,''), IFNULL(active_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(sla_name,''), IFNULL(sla_condition,''), IFNULL(duration_type,''), IFNULL(sla_duration,''), IFNULL(active_flag,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.d_task_sla)

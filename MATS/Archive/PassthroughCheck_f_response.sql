


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_RESPONSE to F_RESPONSE did not match' ELSE 'SUCCESS' END AS Message FROM #TABLE_SCHEMA.fs_response WHERE CRC32(CONCAT( IFNULL(source_id,''), IFNULL(response_value,''), IFNULL(response,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(source_id,''), IFNULL(response_value,''), IFNULL(response,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM #TABLE_SCHEMA.f_response)

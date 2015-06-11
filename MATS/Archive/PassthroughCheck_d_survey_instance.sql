


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from DS_SURVEY_INSTANCE to D_SURVEY_INSTANCE did not match' ELSE 'SUCCESS' END AS Message FROM #TABLE_SCHEMA.ds_survey_instance WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(taken_on,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(taken_on,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM #TABLE_SCHEMA.d_survey_instance)




SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from DS_SURVEY to D_SURVEY did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.ds_survey WHERE CRC32(CONCAT( IFNULL(source_id,''), IFNULL(survey_name,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(source_id,''), IFNULL(survey_name,''), IFNULL(updated_count,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.d_survey)

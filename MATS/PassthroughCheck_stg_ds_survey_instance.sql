

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from SURVEY_INSTANCE_final to DS_SURVEY_INSTANCE did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdsdb.survey_instance_final S 
JOIN app_test.lsm_ls_source_timezone L

ON(S.sourceinstance= L.sourceid)
WHERE CRC32(CONCAT( IFNULL(sys_id,''), IFNULL(sourceinstance,''), IFNULL(convert_tz(taken_on,source_time_zone,target_time_zone),''), IFNULL(sys_mod_count,''), IFNULL(sys_created_by,''), IFNULL(sys_updated_by,''), IFNULL(sys_created_on,''), IFNULL(sys_updated_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(taken_on ,''), IFNULL(updated_count,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.ds_survey_instance)

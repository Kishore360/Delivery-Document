

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from SURVEY_MASTER_final to DS_SURVEY did not match' ELSE 'SUCCESS' END AS Message FROM 
<<tenant>>_mdsdb.survey_master_final WHERE CONCAT( IFNULL(sys_id,''), IFNULL(sourceinstance,''), IFNULL(name,''), IFNULL(sys_mod_count,''), 
IFNULL(sys_created_by,''), IFNULL(sys_updated_by,''), IFNULL(sys_created_on,''), IFNULL(sys_updated_on,'')) NOT IN 
(SELECT CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(survey_name,''), IFNULL(updated_count,''), IFNULL(created_by,''), 
IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,'')) FROM <<tenant>>_workdb.ds_survey)
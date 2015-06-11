

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from SURVEY_QUESTION_NEW_final to DS_SURVEY_QUESTION did not match' 
ELSE 'SUCCESS' END AS Message 
FROM #MDS_TABLE_SCHEMA.survey_question_new_final 
WHERE CRC32(CONCAT( IFNULL(sys_id,''), IFNULL(sourceinstance,''), IFNULL(question_text,''), IFNULL(`order`,''), 
IFNULL(scale_min,''), IFNULL(scale_max,''), IFNULL(`type`,''), IFNULL(sys_mod_count,''), IFNULL(sys_created_by,''), 
IFNULL(sys_updated_by,''), IFNULL(sys_created_on,''), IFNULL(sys_updated_on,''))) 
NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(question,''), IFNULL(question_order,''), 
IFNULL(min_value,''), IFNULL(max_value,''), IFNULL(question_type_src_code,''), IFNULL(updated_count,''), 
IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) 
FROM #TABLE_SCHEMA.ds_survey_question)

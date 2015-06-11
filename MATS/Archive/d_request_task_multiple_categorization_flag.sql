
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.multiple_categorization_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_t_task_activity TA 
 ON (convert(SRC.sys_id using utf8) =convert(TA.task_row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 AND TA.task_wh_type = 'incident' 
AND TA.task_attribute_wh_name =  'category' 
 WHERE CONVERT( CASE WHEN TA.task_attribute_wh_old_value <> TA.task_attribute_wh_new_value THEN 'Y' ELSE 'N' END using utf8)
 <> COALESCE(CONVERT(TRGT.priority_escalated_flag using utf8),'')

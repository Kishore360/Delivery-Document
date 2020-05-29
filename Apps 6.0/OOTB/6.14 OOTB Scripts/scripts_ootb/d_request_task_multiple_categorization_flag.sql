

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.multiple_categorization_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task_activity TA 
 ON (TRGT.row_key  =TA.request_task_key  
 AND SRC.sourceinstance=TA.source_id )
 AND TA.task_wh_type = 'sc_task' 
AND TA.task_attribute_wh_name =  'category' 
and TA.primary_sequence_id<>0
 WHERE  CASE WHEN TA.task_attribute_wh_old_value <> TA.task_attribute_wh_new_value THEN 'Y' ELSE 'N' END 
 <> COALESCE(TRGT.multiple_categorization_flag ,'')

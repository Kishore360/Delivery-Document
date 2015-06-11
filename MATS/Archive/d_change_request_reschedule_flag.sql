

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC
 LEFT JOIN #TABLE_SCHEMA.d_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN #TABLE_SCHEMA.t_task_activity TA 
ON (TA.task_key= TRGT.row_key 
AND  TA.task_wh_type = 'change_request'
AND TA.task_attribute_wh_name = 'end_date' AND  TA.task_attribute_wh_new_value <> TA.task_attribute_wh_old_value )
WHERE CASE WHEN TA.task_key IS NULL THEN 'N' ELSE 'Y' END<> TRGT.rescheduled_flag


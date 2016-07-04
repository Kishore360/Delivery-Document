
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
 
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN   <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.f_change_request_activity TA1
 ON TA1.task_key= TRGT.row_key  
and  TA1.task_wh_type = 'change_request'
AND TA1.task_attribute_wh_name = 'end_date' AND  coalesce(TA1.task_attribute_wh_new_value,'') <> coalesce(TA1.task_attribute_wh_old_value,'') 
and TA1.task_attribute_wh_old_value is not null 
WHERE CASE WHEN TA1.task_key IS NULL THEN 'N' ELSE 'Y' END<> TRGT.rescheduled_flag

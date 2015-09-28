

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.priority_escalated_flag' ELSE 'SUCCESS' END as Message from
 (select 
 CASE WHEN TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value 
THEN 'Y' ELSE 'N' END ABC, COALESCE(TRGT.priority_escalated_flag,'') DEF
 FROM cardinalhealth_mdsdb.sc_request_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN cardinalhealth_mdwdb.f_t_task_activity TA 
 ON (SRC.sys_id =TA.task_row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 AND TA.task_wh_type = 'sc_request' 
AND TA.task_attribute_wh_name =  'priority' )a
 WHERE  ABC<>DEF


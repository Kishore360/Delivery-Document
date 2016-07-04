
 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.multiple_categorization_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.f_incident_activity TA 
 ON (SRC.sys_id  =TA.task_row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 AND TA.task_wh_type = 'incident' 
AND TA.task_attribute_wh_name =  'category' 
 WHERE  CASE WHEN TA.task_attribute_wh_old_value <> TA.task_attribute_wh_new_value THEN 'Y' ELSE 'N' END 
 <> COALESCE(TRGT.multiple_categorization_flag ,'')

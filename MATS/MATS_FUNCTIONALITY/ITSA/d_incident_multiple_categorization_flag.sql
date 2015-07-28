 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.MULTIPLE_CATEGORIZATION_FLAG' ELSE 'SUCCESS' END as Message
 FROM  <<tenant>>_mdwdb.d_incident  TRGT
 LEFT JOIN <<tenant>>_workdb.fs_t_task_activity ta ON  TRGT.row_id = ta.task_id AND TRGT.source_id = ta.source_id  
 AND ta.task_wh_type = 'incident' AND ta.task_attribute_wh_name =  'category'   AND  ta.task_attribute_wh_new_value <> ta.task_attribute_wh_old_value 
 WHERE CASE WHEN ta.task_id IS NULL THEN 'N' ELSE 'Y' END <> COALESCE(TRGT.MULTIPLE_CATEGORIZATION_FLAG ,''); 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.reassignment_count_numerify' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 

LEFT JOIN #DWH_TABLE_SCHEMA.d_incident inc 
ON SRC.sys_id= inc.row_id
AND SRC.sourceinstance=inc.source_id 
and SRC.sys_class_name= 'incident'
    
LEFT JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
ON (SRC.sys_id =TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )  
    
  
WHERE COALESCE(inc.reassignment_count_numerify,0)<> COALESCE(TRGT.reassignment_count_numerify ,'');
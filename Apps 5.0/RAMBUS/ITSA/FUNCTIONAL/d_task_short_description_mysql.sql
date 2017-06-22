
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 rambus_mdsdb.task_final SRC 
  JOIN rambus_mdwdb.d_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.short_description<>TRGT.short_description
 
 
 
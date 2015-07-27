

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.short_description' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.sc_task_final SRC 
 LEFT JOIN svb_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.short_description,'')<> COALESCE(TRGT.short_description ,'')
and length(TRGT.short_description)>254



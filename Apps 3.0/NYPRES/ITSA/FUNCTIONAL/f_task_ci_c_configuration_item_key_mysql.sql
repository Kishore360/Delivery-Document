

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.task_ci_final SRC
 LEFT JOIN nypres_mdwdb.f_task_ci_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nypres_mdwdb.d_configuration_item LKP 
 ON ( SRC.ci_item= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.ci_item IS NULL THEN 0 else -1 end)<> (TRGT.configuration_item_key)

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.alm_stockroom_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_storage_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE case when external = 0 then 'N' else 'Y' END <> TRGT.is_external

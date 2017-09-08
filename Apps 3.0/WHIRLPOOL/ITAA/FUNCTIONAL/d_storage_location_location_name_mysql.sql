SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_by_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_stockroom_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_storage_location TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE name <> TRGT.location_name

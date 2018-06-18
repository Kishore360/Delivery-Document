SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_original_request_item' ELSE 'SUCCESS' END as Message 
FROM  wow_mdsdb.sc_task_final  SRC 
JOIN wow_mdwdb.d_request_task TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN wow_mdwdb.d_request_item LKP 
ON (COALESCE(SRC.request_item,'UNSPECIFIED') = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_item IS NULL THEN 0 else -1 end) <> (TRGT.request_item_c_key)


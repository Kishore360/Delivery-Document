SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.sc_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) and 
TRGT.pivot_date BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> TRGT.assigned_to_key)temp;
 

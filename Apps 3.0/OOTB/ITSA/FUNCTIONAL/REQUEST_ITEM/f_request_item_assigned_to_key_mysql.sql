SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key))temp;
 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM tjx_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tjx_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to )
  join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key))temp;
 

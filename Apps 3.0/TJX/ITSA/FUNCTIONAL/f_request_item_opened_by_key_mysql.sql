
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM tjx_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tjx_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
and COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/New_York'), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York'),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to) 

  join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key))temp;
 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
and COALESCE(CONVERT_TZ (SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to) 

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key))temp;
 
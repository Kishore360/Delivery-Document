
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
and COALESCE(CONVERT_TZ (SRC.opened_at,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),
 CONVERT_TZ (SRC.closed_at,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.closed_by_key,'')


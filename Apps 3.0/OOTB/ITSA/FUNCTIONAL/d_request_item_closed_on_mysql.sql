SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.closed_on' ELSE 'SUCCESS' END as Message  FROM <<tenant>>_mdsdb.sc_req_item_final SRC  
LEFT JOIN <<tenant>>_mdwdb.d_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
<<<<<<< HEAD
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.closed_on 
=======
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> TRGT.closed_on 
>>>>>>> f1fc2cd6f47dd2f514d6f92abcbce7c893ff8b62
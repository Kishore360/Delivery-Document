SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.created_on' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT
FROM <<tenant>>_mdsdb.change_request_final SRC  inner JOIN <<tenant>>_mdwdb.f_change_request TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( convert_tz(SRC.sys_created_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'')<> 
 COALESCE(TRGT.created_on ,''))temp;

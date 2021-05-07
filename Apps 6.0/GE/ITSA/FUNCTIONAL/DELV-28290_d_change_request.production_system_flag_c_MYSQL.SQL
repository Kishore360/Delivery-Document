SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.production_system_flag_c' ELSE 'SUCCESS' END as Message 
FROM ge_mdsdb.change_request_final  SRC 
JOIN ge_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE IF(SRC.production_system =1 , 'Y','N') <> (TRGT.production_system_flag_c) 
and SRC.cdctype ='X' ;

 
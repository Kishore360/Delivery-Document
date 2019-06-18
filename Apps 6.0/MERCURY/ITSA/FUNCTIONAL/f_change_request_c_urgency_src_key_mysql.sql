SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request_c.urgency_src_key' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.change_request_final  SRC 
JOIN mercury_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  and SRC.cdctype<>'D'
JOIN mercury_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~change_request~' ,upper(SRC.urgency)),'UNSPECIFIED') = LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end) <> (TRGT.urgency_src_key) 

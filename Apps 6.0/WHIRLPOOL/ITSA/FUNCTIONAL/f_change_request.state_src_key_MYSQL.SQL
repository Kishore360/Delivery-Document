SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.state_src_key' ELSE 'SUCCESS' END as Message FROM whirlpool_mdsdb.change_request_final  SRC 
JOIN whirlpool_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN whirlpool_mdwdb.d_lov LKP 
ON ( COALESCE(CONCAT('STATE','~','CHANGE_REQUEST','~',SRC.state),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end) <> (TRGT.state_src_key)

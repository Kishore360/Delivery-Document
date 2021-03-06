SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.approval_state_src_key' ELSE 'SUCCESS' END as Message FROM wpl_mdsdb.change_request_final  SRC 
JOIN wpl_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN wpl_mdwdb.d_lov LKP 
ON ( COALESCE(CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(SRC.APPROVAL)),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.approval_state_src_key)
and SRC.CDCTYPE<>'D' ;


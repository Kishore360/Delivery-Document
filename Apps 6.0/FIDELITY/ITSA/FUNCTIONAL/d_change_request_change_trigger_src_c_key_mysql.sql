SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_trigger_src_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('U_CHANGE_TRIGGER','~','CHANGE_REQUEST','~',UPPER(SRC.u_change_trigger)),'UNSPECIFIED') ) 
 and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='U_CHANGE_TRIGGER~CHANGE_REQUEST'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_change_trigger IS NULL THEN 0 else -1 end)<> (TRGT.change_trigger_src_c_key) 

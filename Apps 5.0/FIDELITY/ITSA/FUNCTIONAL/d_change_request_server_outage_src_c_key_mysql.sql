SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.server_outage_src_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('U_SERVER_OUTAGE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.u_server_outage)),'UNSPECIFIED') ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_server_outage IS NULL THEN 0 else -1 end)<> (TRGT.server_outage_src_c_key) 

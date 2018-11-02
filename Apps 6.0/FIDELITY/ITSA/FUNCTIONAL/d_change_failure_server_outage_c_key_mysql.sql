SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN fidelity_mdwdb.d_lov LKP 
ON (COALESCE(CONCAT('U_SERVER_OUTAGE~CHANGE_REQUEST~',SRC.u_server_outage),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_server_outage IS NULL THEN 0 else -1 end)<>(TRGT.server_outage_c_key) 

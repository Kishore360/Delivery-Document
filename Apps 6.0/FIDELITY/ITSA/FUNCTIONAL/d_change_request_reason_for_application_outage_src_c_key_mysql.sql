SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.reason_for_application_outage_src_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('U_REASON_FOR_APPLICATION_OUTAGE','~','CHANGE_REQUEST','~',UPPER(SRC.u_reason_for_application_outage)),'UNSPECIFIED') ) 
 and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='U_REASON_FOR_APPLICATION_OUTAGE'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_reason_for_application_outage IS NULL THEN 0 else -1 end)<> (TRGT.reason_for_application_outage_src_c_key) and SRC.cdctype<>'D' 
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_request_approval_workflow_c_key' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.change_request_final  SRC 
JOIN whirlpool_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN whirlpool_mdwdb.d_lov LKP 
ON (COALESCE(CONCAT('APPROVAL_WORKFLOW~CHANGE_REQUEST~',UPPER(incf.u_approval_workflow)),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN incf.u_approval_workflow IS NULL THEN 0 else -1 end)<> (TRGT.change_request_approval_workflow_c_key) 
and SRC.cdctype='X'

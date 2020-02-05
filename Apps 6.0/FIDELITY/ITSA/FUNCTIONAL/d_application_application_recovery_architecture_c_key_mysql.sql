SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_appl_final  SRC 
JOIN fidelity_mdwdb.d_application TRGT 
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  and SRC.cdctype <>'D'
LEFT JOIN fidelity_mdwdb.d_lov LKP 
ON (COALESCE(CONCAT('RECOVERY_ARCHITECTURE~APPLICATION~',upper(SRC.u_recovery_point_objective_rpo)),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_recovery_point_objective_rpo IS NULL THEN 0 else -1 end)<>(TRGT.application_recovery_architecture_c_key) and SRC.cdctype<>'D'


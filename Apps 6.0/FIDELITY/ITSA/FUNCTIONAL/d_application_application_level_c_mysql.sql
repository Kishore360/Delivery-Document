SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_appl_final  SRC 
JOIN fidelity_mdwdb.d_application TRGT 
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
WHERE CASE WHEN SRC.u_subtype in ('Business Application', 'Infrastructure Application', 'Non-Core Application') THEN 'Primary' ELSE 'Subsystem' END<>(TRGT.application_level_c) and SRC.cdctype<>'D'


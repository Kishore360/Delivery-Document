SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  
fidelity_mdsdb.cmdb_ci_appl_final SRC  
LEFT JOIN fidelity_mdwdb.d_lov LKP on 
COALESCE(CONCAT('DISCOVERY_STATUS~APPLICATION~',u_application_discovery_status),'UNSPECIFIED') =LKP.row_id 
and SRC.sourceinstance=LKP.source_id
JOIN  fidelity_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(LKP.row_key,case when SRC.u_application_discovery_status  is null then 0 else -1 end)<> TRGT.application_discovery_status_c_key and SRC.cdctype<>'D';  



